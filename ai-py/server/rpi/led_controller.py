import sys
from gpiozero import LED
import time

# GPIO pin numbers from README
# Green LED: GPIO 21
# Yellow LED: GPIO 3
leds = {
    'green': LED(21),
    'yellow': LED(3)
}

def control_led(color, state):
    if color not in leds:
        print(f"Error: Invalid color '{color}'. Available colors: {list(leds.keys())}")
        sys.exit(1)

    led = leds[color]

    if state == 'on':
        led.on()
        print(f"{color.capitalize()} LED turned on.")
    elif state == 'off':
        led.off()
        print(f"{color.capitalize()} LED turned off.")
    else:
        print(f"Error: Invalid state '{state}'. Use 'on' or 'off'.")
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python3 led_controller.py <color> <state>")
        print("Example: python3 led_controller.py green on")
        sys.exit(1)

    target_color = sys.argv[1].lower()
    target_state = sys.argv[2].lower()

    control_led(target_color, target_state)
