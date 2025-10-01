import OpenAI from "openai";
const client = new OpenAI({
  apiKey:
    "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 ",
});

const response = await client.responses.create({
  model: "gpt-5-nano",
  input: [
    {
      role: "developer",
      content:
        "너는 다음 일곱 중 하나로 대답한다. [{LED,1,ON},{LED,1,OFF},{LED,2,ON},{LED,2,OFF},{LED,3,ON},{LED,3,OFF},{NULL}]",
    },
    {
      role: "developer",
      content: "위 6가지로 대답할 수 없는 경우에만 null로 대답한다.",
    },
    {
        role: "user",
        content:"LED 1번은 그대로 두고 2번을 켜줘",
    }
  ],
});

console.log(response.output_text);
