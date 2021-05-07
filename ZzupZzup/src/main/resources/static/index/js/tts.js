$(function() {
	var recipe = [];
	$(".tts").each(function() {
		console.log($(this).text());
		recipe.push($(this).text());
	});

	var recipeIdx = 0;
	if (typeof webkitSpeechRecognition !== 'function') {
		alert('크롬에서만 동작 합니다.');
		return false;
	}

	const recognition = new webkitSpeechRecognition();
	const language = 'ko-KR';
	const $btnMic = document.querySelector('#btn-mic');

	let isRecognizing = false;
	let finalTranscript = '';

	recognition.continuous = true;
	recognition.interimResults = true;

	/**
	 * 음성 인식 시작 처리
	 */
	recognition.onstart = function() {
		console.log('onstart', arguments);
		isRecognizing = true;
		$btnMic.className = 'on';
	};

	/**
	 * 음성 인식 종료 처리
	 */
	recognition.onend = function() {
		if (isRecognizing) {
			recognition.start();
			return false;
		}

		console.log('onend', arguments);

		// DO end process
		$btnMic.className = 'off';
		if (!finalTranscript) {
			console.log('empty finalTranscript');
			return false;
		}
	};

	/**
	 * 음성 인식 결과 처리
	 */
	recognition.onresult = function(event) {
		console.log('onresult', event);

		let interimTranscript = '';
		if (typeof event.results === 'undefined') {
			recognition.onend = null;
			recognition.stop();
			return;
		}

		for (let i = event.resultIndex; i < event.results.length; ++i) {
			const transcript = event.results[i][0].transcript;
			if (event.results[i].isFinal) {
				finalTranscript += transcript;
				interimTranscript = transcript;
			}
		}
		console.log('finalTranscript', finalTranscript);
		console.log('interimTranscript', interimTranscript);

		if (interimTranscript.indexOf('다음') >= 0) {
			console.log(recipe[recipeIdx]);
			textToSpeech(recipe[recipeIdx]);
			recipeIdx++;
		}
		if (recipe.length == recipeIdx) {
			$btnMic.click();
		}
	};

	/**
	 * 음성 인식 에러 처리
	 */
	recognition.onerror = function(event) {
		console.log('onerror', event);
		$btnMic.className = 'off';
	};

	/**
	 * 음성 인식 트리거
	 */
	function start() {
		if (isRecognizing) {
			isRecognizing = false;
			recognition.stop();
			return;
		}
		recognition.lang = language;
		recipeIdx = 0;
		recognition.start();

		finalTranscript = '';
	}

	/**
	 * 문자를 음성으로 읽어 줍니다.
	 * 지원: 크롬, 사파리, 오페라, 엣지
	 */
	function textToSpeech(text) {
		console.log('textToSpeech', arguments);
		speechSynthesis.speak(new SpeechSynthesisUtterance(text));
	}

	/**
	 * 초기 바인딩
	 */
	function initialize() {
		$btnMic.addEventListener('click', start);
	}

	initialize();
});