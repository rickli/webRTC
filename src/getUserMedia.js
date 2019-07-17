var promise = navigator.mediaDevice.getUserMedia(constraints);

const mediaStreamContraints = {
    video: {
	frameRate: {min: 20},
	width: {min: 640, ideal: 1280},
	height: {min: 360, ideal: 720},
	aspectRatio: 16/9
    },
    audio: {
	echoCancellation: true,
	noiseSuppression: true,
	autoGainControl: true,
    }
};


