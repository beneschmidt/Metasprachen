
"use strict";

function Student (firstName, lastName, studentId){
	this.weightedGrades = 0;
	this.weightedAverage = 0;
	this.firstName = firstName;
	this.lastName = lastName;
	this.studentId = studentId;
	this.passedExams = 0;
	this.sumOfHoursOfPassedExams = 0;
};


Student.prototype.addGrade = function(grade, hours){
	if(grade <= 4.0){
		this.passedExams++;
		this.sumOfHoursOfPassedExams = this.sumOfHoursOfPassedExams + parseInt(hours);
		this.weightedGrades += hours * grade;
	}
	
	this.weightedAverage = this.weightedGrades / this.sumOfHoursOfPassedExams;	
}

Student.prototype.asHTML = function(){
	return "<tr><td>"+this.studentId+"</td>"+
			"<td>"+this.lastName+"</td>" +
			"<td>"+this.firstName+"</td>" +
			"<td>"+this.passedExams+"</td>"+
			"<td>"+this.sumOfHoursOfPassedExams+"</td>"+
			"<td>"+this.weightedAverage.toFixed(2)+"</td></tr>"
}

function loadXML(filename) {
	var xhttpRequest = new XMLHttpRequest();

	try {
		xhttpRequest.open("GET", filename, false);
		xhttpRequest.send();
		var type = xhttpRequest.getResponseHeader("Content-Type");

		if (xhttpRequest.status != 200)
			throw "HTTP Status:" + xhttpRequest.status;

		if (type.indexOf("xml") == -1)
			throw {error:"Keine gueltige XML Datei gelesen"};

		return xhttpRequest.responseXML;            
	}
	catch (exception) {
		window.alert(exception);
		throw { error: exception };
	}
}

function getFilteredList(doc,tagName,attributeName,compareValue){
		var elements = doc.getElementsByTagName(tagName);
		var array = new Array();
		
		for(var i=0;i<elements.length;i++){
			var compare = elements[i].getAttribute(attributeName);
			if(compareValue == compare)
				array.push(elements[i]);
		}
		
		return array;
}

function parseXML(doc) {

	//TODO anpassung fuer IE
	var it = doc.getElementsByTagName("student");
	
	var array = new Array();
	
	for(var i=0;i<it.length;i++){
		var currentStudent = it[i];
		var lastname = currentStudent.getElementsByTagName("nachname")[0].textContent;
		var firstname = currentStudent.getElementsByTagName("vorname")[0].textContent;
		//TODO trim das M raus
		var studentId = currentStudent.getAttribute("matrikelnr");
	
		var student = new Student(firstname,lastname,studentId);
		
		var gradesIt = getFilteredList(doc,"note","matrikelnr",studentId);
		//var gradesIt = getByXPath(doc, "//prüfungen/prüfung/note[@matrikelnr='"+studentId+"']",doc);
		//var gradeOfStudent = null;
		
		for(var j=0;j<gradesIt.length;j++){
			var gradeOfStudent = gradesIt[j];
			var grade = gradeOfStudent.textContent;
			var courseId = gradeOfStudent.parentNode.getAttribute("vorlesungnr");
			var hours = getFilteredList(doc,"vorlesung","vorlesungnr",courseId)[0].getElementsByTagName("sws")[0].textContent;
			//var hours = getByXPath(doc,"//vorlesung[@vorlesungnr='"+courseId+"']/sws",doc).iterateNext().textContent;
			student.addGrade(grade,hours);
		}
		
		
		array.push(student);
		
		//accumulator +=  student.asHTML();
	}
	var comparator = function(a,b){
			return a.weightedAverage - b.weightedAverage;
	};
		
	array.sort(comparator)
	
	var accumulator = "<table border='1'><tr><th>matrikelnr</th><th>nachname</th><th>vorname</th>"+
						"<th>bestandene Prüfungen</th><th>Bestande ECTS</th>"+
						"<th>Notenschnitt</th></tr>";
	
	for(var i=0;i<array.length;i++)
		accumulator += array[i].asHTML();
		
	accumulator +="</table>";
	
	document.getElementsByTagName("body")[0].innerHTML = accumulator;
}

//function getByXPath(doc,path,context){
//	return doc.evaluate(path, context, null, XPathResult.ANY_TYPE,null);
//}

function XMLtoStudents(filename) {
	try{
		var doc = loadXML(filename);
		parseXML(doc);
	}
	catch(err){
		alert("Fehler beim laden der XML:"+err);
	}
}


window.onload = XMLtoStudents("xml/hochschule1.xml");