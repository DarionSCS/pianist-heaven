<div class="bg-gray-400 shadow-lg rounded-lg p-6">
    <h2 class="text-2xl font-semibold mb-2">{{ $song->title }}</h2>
    <p class="text-black">By {{ $song->artist }}</p>
    <a href="{{ asset('storage/' . $song->pdf_path) }}" target="_blank" class="text-black underline mb-4">
        View PDF
    </a>

    <form id="challenge-form" method="POST" action="{{ route('challenge.complete.mail') }}">
        @csrf
        <input type="hidden" name="song_id" value="{{ $song->id }}">
        <input type="hidden" name="success" id="success" value="0">
        <input type="hidden" name="time_spent" id="time-spent" value="0">

        <div class="mb-4">
            <label for="timer" class="block mb-2 font-medium">Set Your Timer</label>
            <select id="timer" class="p-2 border rounded w-full">
                <option value="2">2 seconds (for testing)</option>
                <option value="1800">30 minutes</option>
                <option value="3600">1 hour</option>
            </select>
        </div>

        <button type="button" id="start-button" class="bg-black text-white px-4 py-2 rounded hover:bg-blue-700">
            Start Challenge
        </button>
    </form>
    <div id="countdown" class="mt-4 text-center text-2xl font-semibold"></div>
</div>

<script>
    document.getElementById('start-button').addEventListener('click', function () {
        const timerSelect = document.getElementById('timer');
        const countdown = document.getElementById('countdown');
        const timeSpentInput = document.getElementById('time-spent');

        let timeLeft = parseInt(timerSelect.value);
        countdown.innerText = `${Math.floor(timeLeft / 60)}:${timeLeft % 60}`;

        const interval = setInterval(() => {
            timeLeft--;
            if (timeLeft <= 0) {
                clearInterval(interval);
                countdown.innerText = "Time's up!";
                document.getElementById('success').value = 1;
                document.getElementById('challenge-form').submit();
            } else {
                countdown.innerText = `${Math.floor(timeLeft / 60)}:${timeLeft % 60}`;
            }
        }, 1000);
    });
</script>
