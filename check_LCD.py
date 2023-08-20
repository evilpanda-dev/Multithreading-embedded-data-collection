import serial
import time

# Create a serial connection
lcd = serial.Serial('/dev/ttyUSB0', 500000)

# Clear the LCD
lcd.write(b'\xFE\x01')

# Set cursor to home
lcd.write(b'\xFE\x80')

# Write a message to the LCD
lcd.write(b'Hello, World!')

# Wait for a bit to ensure the message is written
time.sleep(2)

# Close the connection
lcd.close()
