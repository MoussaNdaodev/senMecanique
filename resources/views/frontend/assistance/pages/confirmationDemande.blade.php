<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmation d'Inscription</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;nn
            margin: auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #c0392b; /* Rouge */
            text-align: center;
        }
        p {
            line-height: 1.6;
            margin: 15px 0;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9em;
            color: #999;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            font-size: 16px;
            color: #fff;
            background-color: #c0392b; /* Rouge */
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
        }
        .btn:hover {
            background-color: #a93226;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row text-center mb-4">
            <img src="{{asset('frontend/img/favicon.png')}}" style="width: 150px;" alt="logo de l'entreprise" class="mx-auto">
        </div>
        <p>Votre Deamande a été confirmer avec succés</p>
        <div class="footer">
            <p>&copy; 2024 SenMecanique. Tous droits réservés.</p>
        </div>
    </div>
</body>
</html>