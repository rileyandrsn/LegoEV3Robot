global key
InitKeyboard();
brick.SetColorMode(2, 4); %initializes color sensor
while true %keeps program running until manually terminated
    if(key == 'q') %if q is pressed, move 'C' motor for 0.75 seconds, lifts up arms.
        brick.StopAllMotors('Coast');
        brick.MoveMotor('C',15);
        pause(0.75);
        brick.StopAllMotors('Coast');
        break;
    end
    brick.SetColorMode(2, 4); %redundant code? initializes color sensor
    color_rgb = brick.ColorRGB(2); %Initializes color_rgb as the number of green detected from the color sensor
        brick.MoveMotor('A', -15); %moves left 'A' motor at speed of 15, negative value reflects inverted motors on physical lego robot
        brick.MoveMotor('D', -15); %moves right 'D' motor at speed of 15
    if (brick.TouchPressed(4)) %if lego touch sensor is pressed (true)
        brick.StopAllMotors('Coast'); %stops the robot
        brick.MoveMotor('D', 15); %reverses the robot at speed of 15 on the 'D' motor
        brick.MoveMotor('A', 15); %reverses the robot at speed of 15 on the 'A' motor
        pause(1); %reverses robot for 1 second
        if (brick.UltrasonicDist(1) <= 20) %if after the touch sensor is pressed, the ultrasonic sensor has a value less than or equal to 20, turn left for 1.8 seconds
        brick.MoveMotor('D', 15);
        brick.MoveMotor('A', -15);
        pause(1.8);
        elseif (brick.UltrasonicDist(1) > 20) %else if after touch sensor is pressed, the distance is greater than 20, turn right for 1.8 seconds
        brick.MoveMotor('D', -15);
        brick.MoveMotor('A', 15);
        pause(1.8);
        end
        brick.StopAllMotors('Coast');
        pause(0.5);
    end
    if color_rgb(2) < 40 %if the color sensor detects the green value of the color red, stop for one second
        brick.StopAllMotors('Coast');
        pause(1);
    elseif color_rgb(2) > 125 && color_rgb(2) < 200 % if the color sensor detects the green value of the color green, beep three times
        brick.StopAllMotors('Coast');
        brick.beep();
        pause(0.3);
        brick.beep();
        pause(0.3);
        brick.beep();
        pause(0.3);
    elseif color_rgb(3) > 200 %if the color sensor detects the green value of the color blue, beep twice
        brick.StopAllMotors('Coast');
        brick.beep();
        pause(0.3);
        brick.beep();
        pause(0.3);
    end
        brick.MoveMotor('A', -15); %default move forward
        brick.MoveMotor('D', -15);
end
