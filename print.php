<?php 
session_start();
include_once('sql_func.php');

function printStudentInformation($data) 
{

	$str = "<br> <br> <b> Roll no : </b> : ";
	$str .= $data['roll']; 
	$str .= "<br>";

	if(strlen($data['roll']) < 7)
	{
		$_SESSION['completeInfo'] = "no";
	} 
	$str .= "<b> Specialization : </b>";
	$course = $data['specialization'];
	if($course == "xx") {
		$str .= "Not Given <br>";
		$_SESSION['completeInfo'] = "no";
	}
	else if($course == "ee1") {
		$str .= "Communication <br>";
	}
	else if($course == "ee2") {
		$str .= "Control and Computing <br>";
	}
	else if($course == "ee3") {
		$str .= "Power Electronics and System <br>";
	}
	else if($course == "ee4") {
		$str .= "Microelectronics and VLSI <br>";
	}
	else {
		$str .= "Electronic Systems <br>";
	}
	
	$str .= "<b> Program </b>";
	$prog = $data['program'];
	switch($prog) 
	{
	case "xx" :
		$str .= "Not given <br>";
		$_SESSION['completeInfo'] = "no";
		break;
	case "rs" :
		$str .= "Research Scholar <br>";
		break;
	case "mtech" :
		$str .= "Master of Technology <br>";
		break;
	case "dd" :
		$str .= "Dual Degree (B.Tech + M.Tech.) <br>";
		break;
	} 

	$str .= "<b> Category : </b>";

	$cat = $data['category'];
	switch($cat) 
	{
	case "xx" :
		$str .= "Not given <br>";
		$_SESSION['completeInfo'] = "no";
		break;
	case "ta" :
		$str .= "Teaching Assistant <br>";
		break;
	case "ira" :
		$str .= "Institute Research Assistant <br>";
		break;
	case "pra" :
		$str .= "Project Research Assistant <br>";
		break;
	case "sf":
		$str .= "Self Financed <br>";
		break;
	case "qip" :
		$str .= "Qualility Imporvement Program <br>";
		break;
	case "sponsored" :
		$str .= "Sponsored <br>";
		break;
	}

	$gradYear = $data['gradYear'];
	$gradMonth = $data['gradSem'];
	
	$str .= "<b> Graduating on </b> : ".$gradYear." , ".$gradMonth." semester <br>";

	return $str;
}

function printCourse($course) 
{
	$id = $course['id'];
	$name = $course['name'];
	$faculty = $course['faculty'];

	return $id." : ".$faculty;
}

function printPreference($preferences)
{
	$first = getCourseNameFaculty($preferences['first']);
	$second = getCourseNameFaculty($preferences['second']);
	$third = getCourseNameFaculty($preferences['third']);

	$str .= "<table border='1'>";
	$str .= "<tr> <td> First </td> <td> <b>".$first['id']." : ".$first['faculty']."</b> </td> </tr>";
	$str .= "<tr> <td> Second </td> <td> <b>".$second['id']." : ".$second['faculty']."</b> </td> </tr>";
	$str .= "<tr> <td> Third </td> <td> <b>".$third['id']." : ".$third['faculty']."</b> </td> </tr>";
	$str .= "</table>";
	
	return $str;
}
?>
