action
emailTemplate
	^ '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Nouveau mot de passe</title>
</head>
<body style="background-color: #00695C;margin:0;padding:0;">
<div style="background-color: #FFF;display:block;margin: auto;width:80%;color:black;margin-top:100px;border-radius: 5px; padding: 30px;font-family:''Lato'', ''Helvetica Neue'',Helvetica,Arial,sans-serif;">
    <p>Bonjour {{{USERNAME}}},</p>
    <br>
    <p>Voici votre nouveau mot de passe: {{{PASSWORD}}}.</p>
</div>
</body>
</html>'