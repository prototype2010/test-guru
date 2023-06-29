document.addEventListener('turbolinks:load', () => {
	checkTestTime();
})

function checkTestTime() {
	const timerNode = document.getElementById('timer')

	if(!timerNode) {
		return;
	}

	const endTimeEncoded = document.cookie
		.split("; ")
		.find((row) => row.startsWith("end_time="))
		?.split("=")[1];

	if(!endTimeEncoded) {
		return;
	}

	const endTimeString = decodeURIComponent(endTimeEncoded)
	const endTime = new Date(endTimeString).getTime()

	setInterval(() => {
		if(isOutOfTime(endTime)) {
			submit()
		} else {
			const currentTime = new Date().getTime()
			timerNode.textContent = millisecondsToReadableFormat(endTime - currentTime)
		}
	}, 1000 )
}

function isOutOfTime(endTime) {
	const currentTime = new Date().getTime()

	return currentTime > endTime
}

function submit(){
	document.querySelector('form[name="answer"]')?.submit()
}

function millisecondsToReadableFormat(ms) {
	const minutes = Math.floor(ms / 1000 / 60)
	const seconds = Math.floor( ms / 1000 % 60)

	return `${minutes}:${seconds < 10 ? '0' + seconds : seconds}`
}
