<?php
session_start();

$init = $_SESSION['init'];
$base_url = "http://".$init['base_url'];
$this_sem = $_SESSION['sem'];
$ldap = $_SESSION['ldap'];

function getCourseNameFaculty($id) 
{
	$init = $_SESSION['init'];
	$con = mysql_connect($init['db_ip'], $init['db_user'], $init['db_pass']);
	if(!$con) 
	{
		return null;
	}
	else 
	{
		$res = mysql_select_db("eecourses", $con);
		$query = sprintf("select name, faculty from courses where id='%s'"
			, mysql_real_escape_string($id)
		);
		$res = mysql_query($query, $con);
		$result = mysql_fetch_assoc($res);
		mysql_free_result($res);
		return $result;
	}
}


function getCourseList($sem) 
{
	$db = "ta".$sem;
	$init = $_SESSION['init'];
	$con = mysql_connect($init['db_ip'], $init['db_user'], $init['db_pass']);
	if(!$con) 
	{
		return null;
	}

	else {
		$res = mysql_select_db($db, $con);
		$query = sprintf("select id, name, faculty from course where running='%s'"
			, mysql_real_escape_string("yes"));
		$res = mysql_query($query, $con);
		$course_list = array();
		while($row = mysql_fetch_array($res))
		{
			array_push($course_list, $row);
		}
		mysql_free_result($res);
		return $course_list;
	}
}

function getPreferennces($sem) 
{
	$db = "ta".$sem;
	$init = $_SESSION['init'];
	$ldap = $_SESSION['ldap'];
	$con = mysql_connect($init['db_ip'], $init['db_user'], $init['db_pass']);
	if(!$con) 
	{
		return null;
	}

	else 
	{
		$res = mysql_select_db($db, $con);
		$query = sprintf("select first, second, third from preference where ldap='%s'"
			, mysql_real_escape_string($ldap)
		);
		$res = mysql_query($query, $con);
		$preferences = mysql_fetch_assoc($res);
		return $preferences;
	}
}

function pushPreferences($sem, $post) 
{
	$db = "ta".$sem;
	$init = $_SESSION['init'];
	$ldap = $_SESSION['ldap'];
	$con = mysql_connect($init['db_ip'], $init['db_user'], $init['db_pass']);
	if(!$con) 
	{
		return null;
	}

	else 
	{
		$first = $post['first'];
		$seccond = $post['second'];
		$third = $post['third'];
		/* if entry is already present then update else insert. */
		if(getPreferennces($sem))
		{
			$res = mysql_select_db($db, $con);
			$query = sprintf("update preference set first='%s', second='%s'
				, third='%s' where ldap='%s'"
				, mysql_real_escape_string($first)
				, mysql_real_escape_string($second)
				, mysql_real_escape_string($third)
				, mysql_real_escape_string($ldap)
				);
			$res = mysql_query($query, $con);
			return $res;
		}
		else 
		{
			$res = mysql_select_db($db, $con);
			$query = sprintf("insert into preference set first='%s', second='%s'
				, third='%s', ldap='%s'"
				, mysql_real_escape_string($first)
				, mysql_real_escape_string($second)
				, mysql_real_escape_string($third)
				, mysql_real_escape_string($ldap)
				);
			$res = mysql_query($query, $con);
			return $res;
		}
	}
}

?>
