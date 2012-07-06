// Use AJAX to get nvram
var http_request = false;

function makeRequest(url) {
	http_request = new XMLHttpRequest();
	if (http_request && http_request.overrideMimeType)
		http_request.overrideMimeType('text/xml');
	else
		return false;

	http_request.onreadystatechange = function(){
			alertContents(this);
		};
	http_request.open('GET', url, true);
	http_request.send(null);
}

var xmlDoc_ie;

function makeRequest_ie(file)
{
	xmlDoc_ie = new ActiveXObject("Microsoft.XMLDOM");
	xmlDoc_ie.async = false;
	if (xmlDoc_ie.readyState==4)
	{
		xmlDoc_ie.load(file);
	}
}

function alertContents(request_obj)
{
}
