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
}

.rating-symbol{
  font-size: 20px;
}

.material-switch > input[type="checkbox"] {
    display: none;   
}

.material-switch > label {
    cursor: pointer;
    height: 0px;
    position: relative; 
    width: 40px;  
}

.material-switch > label::before {
    background: rgb(0, 0, 0);
    box-shadow: inset 0px 0px 10px rgba(0, 0, 0, 0.5);
    border-radius: 8px;
    content: '''';
    height: 16px;
    margin-top: -8px;
    position:absolute;
    opacity: 0.3;
    transition: all 0.4s ease-in-out;
    width: 40px;
}
.material-switch > label::after {
    background: rgb(255, 255, 255);
    border-radius: 16px;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
    content: '''';
    height: 24px;
    left: -4px;
    margin-top: -8px;
    position: absolute;
    top: -4px;
    transition: all 0.3s ease-in-out;
    width: 24px;
}
.material-switch > input[type="checkbox"]:checked + label::before {
    background: inherit;
    opacity: 0.5;
}
.material-switch > input[type="checkbox"]:checked + label::after {
    background: inherit;
    left: 20px;
}'