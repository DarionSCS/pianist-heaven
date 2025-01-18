<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Song extends Model
{
    use HasFactory;

    protected $fillable = ['title', 'artist', 'description', 'pdf_path', 'user_id'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function interactions()
    {
        return $this->hasMany(Interaction::class);
    }

}
