javascript
oonozCss
	^ '.oonoz-badges{
  display: flex;	
}

.panel-default>.panel-heading .badge.badge-success{
background-color:rgba(139,195,74 ,1);
}

.panel-default>.panel-heading .badge.badge-danger{
background-color:rgba(244,67,54,1);
}

.indicator{
    background: url(http://placekitten.com/g/1920/1000) repeat;
}

.checkbox input[type="checkbox"]:indeterminate + label::after, .checkbox input[type="radio"]:indeterminate + label::after{ 
  display: none !important; 
}'