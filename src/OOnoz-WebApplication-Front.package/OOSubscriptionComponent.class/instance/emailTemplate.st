actions
emailTemplate
	^ '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inscription à OOnoz</title>
</head>
<body style="background-color: #00695C;margin:0;padding:0;">
<div style="background-color: #FFF;display:block;margin: auto;width:80%;color:black;margin-top:100px;border-radius: 5px; padding: 30px;font-family:''Lato'', ''Helvetica Neue'',Helvetica,Arial,sans-serif;">
    <p>Merci de nous rejoindre ! Pour activer votre compte veuillez cliquer sur le lien suivant ou le copier coller dans
        l''URL de votre navigateur: </p>
    <a href="{{{URL}}}"
       style="text-decoration: none;color:#00695C;">{{{URL}}}</a>

</div>
</body>
</html>'