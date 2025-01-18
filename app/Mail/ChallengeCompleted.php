<?php

namespace App\Mail;

use App\Models\Song;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ChallengeCompleted extends Mailable
{
    use Queueable, SerializesModels;

    public $song;

    public function __construct(Song $song)
    {
        $this->song = $song;
    }

    public function build()
    {
        return $this
            ->subject('Challenge Completed!')
            ->view('emails.challenge_completed')
            ->with([
                'songTitle' => $this->song->title,
                'songArtist' => $this->song->artist,
            ]);
    }
}
