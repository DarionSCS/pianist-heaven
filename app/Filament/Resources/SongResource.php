<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SongResource\Pages;
use App\Filament\Resources\SongResource\RelationManagers;
use App\Models\Song;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class SongResource extends Resource
{
    protected static ?string $model = Song::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form->schema([
            Forms\Components\TextInput::make('title')->required()->label('Title'),
            Forms\Components\TextInput::make('artist')->required()->label('Artist'),
            Forms\Components\Textarea::make('description')->label('Description'),
            Forms\Components\FileUpload::make('pdf_path')
                ->label('PDF File')
                ->directory('songs/pdfs')
                ->required()
                ->acceptedFileTypes(['application/pdf']),
            Forms\Components\BelongsToSelect::make('user_id')
                ->relationship('user', 'name')
                ->label('Uploaded By')
                ->required(),
        ]);
    }



    public static function table(Table $table): Table
    {
        return $table->columns([
            Tables\Columns\TextColumn::make('id')->sortable()->label('ID'),
            Tables\Columns\TextColumn::make('title')->searchable()->sortable()->label('Title'),
            Tables\Columns\TextColumn::make('artist')->searchable()->sortable()->label('Artist'),
            Tables\Columns\TextColumn::make('user.name')->label('Uploaded By'),
            Tables\Columns\TextColumn::make('created_at')->dateTime()->label('Uploaded At'),
        ]);
    }



    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSongs::route('/'),
            'create' => Pages\CreateSong::route('/create'),
            'edit' => Pages\EditSong::route('/{record}/edit'),
        ];
    }
}
