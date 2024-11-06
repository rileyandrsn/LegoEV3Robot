global key
InitKeyboard();
brick.SetColorMode(2, 4);
while true
    if(key == 'q')
        brick.StopAllMotors('Coast');
        brick.MoveMotor('C',15);
        pause(0.75);
        brick.StopAllMotors('Coast');
        break;
    end
    brick.SetColorMode(2, 4);
    color_rgb = brick.ColorRGB(2); 

        brick.MoveMotor('A', -15);
        brick.MoveMotor('D', -15);
    if (brick.TouchPressed(4))
        brick.StopAllMotors('Coast');
        brick.MoveMotor('D', 15);
        brick.MoveMotor('A', 15);
        pause(1);
        if (brick.UltrasonicDist(1) <= 20)
        brick.MoveMotor('D', 15);
        brick.MoveMotor('A', -15);
        pause(1.8);
        elseif (brick.UltrasonicDist(1) > 20)
        brick.MoveMotor('D', -15);
        brick.MoveMotor('A', 15);
        pause(1.8);
        end
        brick.StopAllMotors('Coast');
        pause(0.5);
    end
    if color_rgb(2) < 40
        brick.StopAllMotors('Coast');
        pause(1);
    elseif color_rgb(2) > 125 && color_rgb(2) < 200
        brick.StopAllMotors('Coast');
        brick.beep();
        pause(0.3);
        brick.beep();
        pause(0.3);
        brick.beep();
        pause(0.3);
    elseif color_rgb(3) > 200
        brick.StopAllMotors('Coast');
        brick.beep();
        pause(0.3);
        brick.beep();
        pause(0.3);
    end
        brick.MoveMotor('A', -15);
        brick.MoveMotor('D', -15);
end
