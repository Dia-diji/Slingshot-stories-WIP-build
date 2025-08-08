import flixel.addons.effects.FlxTrail;

function create() {
    GameOverSubstate.script = "data/scripts/GameOvers/grieving";

    strumLines.members[0].characters[1].visible = false;
    trail = new FlxTrail(strumLines.members[0].characters[1], null, 5, 24, 0.4, 0.1);
    camGame.alpha = 0;

    strumLines.members[1].characters[1].visible = false;
}

function onSongStart() {
    lerpCam = false;
    defaultCamZoom = camGame.zoom = 2;
    //camGame.followLerp = 0;
    camGame.scroll.y -= 500;
    camGame.scroll.x += 350;
    FlxTween.tween(camGame, {"alpha": 1}, 2.461);
    FlxTween.tween(camGame, {"zoom": 0.95}, 2.461);
    FlxTween.tween(camGame.scroll, {"x": -500}, 2.461);
    FlxTween.tween(camGame.scroll, {"y": 860}, 2.461);
}

function beatHit(curBeat:Int) {
    switch(curBeat) {
        case 8:
            lerpCam = true;
            //camGame.followLerp = startLerp;
            defaultCamZoom = 0.95;
        case 104:
            defaultCamZoom = 1.1;
        case 109:
            defaultCamZoom = 0.95;
        case 120:
            defaultCamZoom = 1.1;
        case 125:
            defaultCamZoom = 0.95;
        case 136:
            FlxTween.tween(camHUD, {"alpha": 0}, 0.5);
            defaultCamZoom = 1.15;
        case 143:
            PlayState.instance.insert(PlayState.instance.members.indexOf(dad), trail);
            //iconP2.setIcon("dark");
            strumLines.members[0].characters[0].visible = false;
            strumLines.members[0].characters[1].visible = true;
            FlxTween.tween(strumLines.members[0].characters[1], {"y": 500}, 1.5, {type: FlxTween.PINGPONG, ease: FlxEase.sineInOut});

            strumLines.members[1].characters[0].visible = false;
            strumLines.members[1].characters[1].visible = true;
        case 144:
            defaultCamZoom = 0.95;
            camHUD.alpha = 1;
            if (health > 0.5) {
                health -= 0.5;
            }
        case 444:
            //iconP2.setIcon("darkfaker");
            camHUD.alpha = 1;
            strumLines.members[0].characters[1].visible = false;
            strumLines.members[0].characters[0].visible = true;
            trail.visible = false;
        case 508:
            FlxTween.tween(camGame, {"alpha": 0}, 0.5);
        case 516:
            //iconP2.setIcon("dark");
            camGame.alpha = 1;
            strumLines.members[0].characters[0].visible = false;
            strumLines.members[0].characters[1].visible = true;
            trail.visible = true;
    }
}