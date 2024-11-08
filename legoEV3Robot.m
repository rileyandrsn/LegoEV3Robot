blueHit = false;
greenHit = false;

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

        brick.MoveMotor('A', -35);
        brick.MoveMotor('D', -35);
    if (brick.TouchPressed(4))
        brick.StopAllMotors('Coast');
        brick.MoveMotor('D', 20);
        brick.MoveMotor('A', 20);
        pause(1);
        if (brick.UltrasonicDist(1) <= 35)
        brick.MoveMotor('D', 15);
        brick.MoveMotor('A', -15);
        pause(2.8);
        elseif (brick.UltrasonicDist(1) > 35)
        brick.MoveMotor('D', -15);
        brick.MoveMotor('A', 15);
        pause(2.8);
        end
        brick.StopAllMotors('Coast');
        pause(0.5);
    end
    if color_rgb(1) > 60
        brick.StopAllMotors('Coast');
        pause(1);
    elseif color_rgb(3) == 144
        if(blueHit == false)
        brick.StopAllMotors('Coast');
        brick.playTone(1,1,400);
        pause(0.45);
        brick.playTone(1,1,400);
        pause(0.45);
        blueHit = true;
        end
    elseif color_rgb(2) == 59
        if(greenHit == false)
        brick.StopAllMotors('Coast');
        brick.playTone(1,1,400);
        pause(0.45);
        brick.playTone(1,1,400);
        pause(0.45);
        brick.playTone(1,1,400);
        pause(0.45);
        greenHit = true;
        end
    end
        brick.MoveMotor('A', -35);
        brick.MoveMotor('D', -35);
end
