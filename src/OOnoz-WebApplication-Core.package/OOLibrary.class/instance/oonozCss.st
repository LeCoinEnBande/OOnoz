javascript
oonozCss
	^ '.oonoz-badges{
  display: flex;	
}

.bootstrap-table .fixed-table-container{
	border: 1px solid transparent;
}

body .bootstrap-table .table.table-no-bordered > tbody > tr > td{
    border-right: 2px solid transparent;
}

body .bootstrap-table .table > thead > tr > th {
    border-bottom: 2px solid #26A69A;
}

div.slider-handle{
	background-color: #1abc9c;
	background-image: -webkit-linear-gradient(top,#26A69A 0,#00897B 100%);
	background-image: -o-linear-gradient(top,#26A69A 0,#00897B 100%);
	background-image: linear-gradient(to bottom,#26A69A 0,#00897B 100%);
}

div.slider-tick.in-selection {
	background-image: -webkit-linear-gradient(top,#26A69A 0,#00897B 100%);
	background-image: -o-linear-gradient(top,#26A69A 0,#00897B 100%);
	background-image: linear-gradient(to bottom,#26A69A 0,#00897B 100%);
}

div.slider-selection.tick-slider-selection {
    background-image: -webkit-linear-gradient(top,#4DB6AC 0,#80CBC4 100%);
    background-image: -o-linear-gradient(top,#4DB6AC 0,#80CBC4 100%);
    background-image: linear-gradient(to bottom,#4DB6AC 0,#80CBC4 100%);
}

div.slider.slider-horizontal .slider-track {
    height: 6px;
    margin-top: -2px;
}

div.slider.slider-horizontal .slider-tick{
    margin-left: 0px;
    margin-top: 6px;
}

div.slider-tick {
    width: 10px;
    height: 10px;
}

div.slider.slider-horizontal .slider-handle {
    margin-left: -5px;
    margin-top: 3px;
}

div.slider-handle {
    width: 16px;
    height: 16px;
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

.jumbotron{
	margin-bottom: 0px !important;
	color: white !important;
}

#queryResult figure:hover, .possibilities figure:hover { 
	border: 2px solid #1abc9c;
 }

#queryResult a figure, .possibilities a figure {
    color: #0f0f0f;
}

.material-switch > input[type="checkbox"] {
    display: none;
}

.material-switch > label {
    cursor: pointer;
    height: 0px;
    position: relative;
    width: 28px;
}

.material-switch > label::before {
    background: rgb(0, 0, 0);
    box-shadow: inset 0px 0px 10px rgba(0, 0, 0, 0.5);
    border-radius: 8px;
    content: '''';
    height: 10px;
    margin-top: -5px;
    position:absolute;
    opacity: 0.3;
    transition: all 0.4s ease-in-out;
    width: 28px;
}
.material-switch > label::after {
    background: rgb(255, 255, 255);
    border-radius: 16px;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
    content: '''';
    height: 16px;
    left: -1px;
    margin-top: -5px;
    position: absolute;
    top: -3px;
    transition: all 0.3s ease-in-out;
    width: 16px;
}
.material-switch > input[type="checkbox"]:checked + label::before {
    background: inherit;
    opacity: 0.5;
}
.material-switch > input[type="checkbox"]:checked + label::after {
    background: inherit;
    left: 12px;
}


.chartJsChart{
	width: 100%;
}'