<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Challenge Completed</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: white;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            text-align: center;
        }
        h1 {
            font-size: 2.5rem;
            color: #4caf50;
            margin-bottom: 10px;
        }
        h2 {
            font-size: 1.8rem;
            color: #333;
            margin: 15px 0;
        }
        p {
            font-size: 1rem;
            color: #555;
            margin: 10px 0;
        }
        .button-container {
            margin-top: 20px;
        }
        .button {
            background-color: #4caf50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            font-size: 1rem;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .button:hover {
            background-color: #45a049;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Congratulations!</h1>
    <p>You have successfully completed the challenge for the song:</p>
    <h2>{{ $songTitle }}</h2>
    <p>We hope you enjoyed learning this piece!</p>
    <div class="button-container">
        <a href="{{ route('home') }}" class="button">Back to Home</a>
    </div>
</div>
</body>
</html>
