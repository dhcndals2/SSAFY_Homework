import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import OpenAI from 'openai';
import { exec } from 'child_process';

// Load environment variables from .env file
dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// Initialize OpenAI client
const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
});

// API endpoint for chat
app.post('/chat', async (req, res) => {
  const { message } = req.body;

  if (!message) {
    return res.status(400).json({ error: 'Message is required' });
  }

  try {
    const completion = await openai.chat.completions.create({
      model: 'gpt-3.5-turbo',
      messages: [
        {
          role: 'system',
          content: `
You are a helpful assistant that controls Raspberry Pi LEDs. You must answer in one of the following seven formats ONLY:
- {LED,1,ON} for turning the green LED on.
- {LED,1,OFF} for turning the green LED off.
- {LED,2,ON} for turning the yellow LED on.
- {LED,2,OFF} for turning the yellow LED off.
- {NULL} if the user's request is not related to controlling the LEDs.
Do not include any other text or explanations in your response.
`,
        },
        {
          role: 'user',
          content: message,
        },
      ],
      temperature: 0,
    });

    const aiResponse = completion.choices[0].message.content.trim();
    console.log('AI Response:', aiResponse);

    const match = aiResponse.match(/\{LED,(\d),(\w+)\}/);

    if (match) {
      const ledNum = parseInt(match[1], 10);
      const state = match[2].toLowerCase();
      const color = ledNum === 1 ? 'green' : 'yellow';

      if ((ledNum === 1 || ledNum === 2) && (state === 'on' || state === 'off')) {
        const command = `python3 /home/ssafy/work/ai-py/server/rpi/led_controller.py ${color} ${state}`;
        
        exec(command, (error, stdout, stderr) => {
          if (error) {
            console.error(`exec error: ${error}`);
            return res.status(500).json({ reply: "Sorry, I failed to control the LED." });
          }
          console.log(`stdout: ${stdout}`);
          console.error(`stderr: ${stderr}`);
          
          // Send a natural language response
          res.json({ reply: `Okay, I've turned the ${color} LED ${state}.` });
        });
      } else {
        res.json({ reply: "I can only control the green (1) and yellow (2) LEDs." });
      }
    } else {
      // Handle cases where the AI returns {NULL} or a conversational response
      res.json({ reply: "I can only help with controlling the green and yellow LEDs. How can I assist you with that?" });
    }
  } catch (error) {
    console.error('Error processing chat message:', error);
    res.status(500).json({ error: 'Failed to process message' });
  }
});

// Root endpoint
app.get('/', (req, res) => {
  res.send('Backend server is running.');
});

app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});
