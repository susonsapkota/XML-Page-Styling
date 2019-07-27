

<?php

function OpenCon()
{
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpass = "";
    $db = "emerging";
    $conn = new mysqli($dbhost, $dbuser, $dbpass, $db) or die("Connect failed: %s\n" . $conn->error);
    
    return $conn;
}

// database connection
$conn = OpenCon();

$company_detail = "SELECT * FROM company";
$details= $conn->query($company_detail);

$project_detail = "SELECT * FROM project";
$project= $conn->query($project_detail);

$department_detail = "SELECT * FROM departments";
$department=$conn->query($department_detail);

$webdev_details = "SELECT * FROM `development` where development_type = 'web_development'";
$webdev = $conn->query($webdev_details);

$mobdev_details = "SELECT * FROM `development` where development_type = 'mobile_development'";
$mobdev = $conn->query($mobdev_details);


// Creating XML
$xml             = new DOMDocument();
$xml->encoding   = 'utf-8';
$xml->xmlVersion = '1.0';



$xml->formatOutput = true;

$cssTag = $xml->createElement('company_details');

$root = $xml->createElement('WaveTech');
$xml->appendChild($root);

// for all tags under company details 
$company_details_tag = $xml->createElement('company_details');
$root->appendChild($company_details_tag);
while ($row = mysqli_fetch_assoc($details)) {
    $comp_det = $xml->createElement($row["name"], $row["data"]);
    $company_details_tag->appendChild($comp_det);
}

$department_tag = $xml->createElement('departments');
$root->appendChild($department_tag);

// for all tags under different departments
$finance_tag = $xml->createElement('finance');
$department_tag->appendChild($finance_tag);

$hr_tag = $xml->createElement('HR');
$department_tag->appendChild($hr_tag);

$marketing_tag = $xml->createElement('marketing');
$department_tag->appendChild($marketing_tag);

$RandD_tag = $xml->createElement('research_and_development');
$department_tag->appendChild($RandD_tag);

while ($row = mysqli_fetch_assoc($department)) {

    if($row["department_name"] == "finance"){
        $details = $xml->createElement($row["post"], $row["name"]);
        $finance_tag->appendChild($details);

    } elseif($row["department_name"] == "HR"){
        $details = $xml->createElement($row["post"], $row["name"]);
        $hr_tag->appendChild($details);

    }elseif($row["department_name"] == "marketing"){
        $details = $xml->createElement($row["post"], $row["name"]);
        $marketing_tag->appendChild($details);

    }elseif($row["department_name"] == "research_and_development"){
        $details = $xml->createElement($row["post"], $row["name"]);
        $RandD_tag->appendChild($details);
    }
}
$dev_tag = $xml->createElement('development');
$department_tag->appendChild($dev_tag);

// for tags under webdevelopment
$web_dev_tag = $xml->createElement('web_development');
$dev_tag->appendChild($web_dev_tag);

while ($row = mysqli_fetch_assoc($webdev)) {
    
    $prj_mgr = new DOMAttr('prj_mgr', $row["project_manager"]); //setting the project manager of web_dev 
    $web_dev_tag->setAttributeNode($prj_mgr);
    
    $team_tag; // declaring outside the scope of if so that variable can be used later
    if ($row["post"] == "manager") { // when manager comes then create new tag which consist of other tags
        $team_tag = $xml->createElement('team');
        $web_dev_tag->appendChild($team_tag);
        $team_id = new DOMAttr('web_dev_id', $row["team_id"]);
        $team_tag->setAttributeNode($team_id);
        
        if (!is_null($row["project_id"])) {
            $project_id = new DOMAttr('project_id', $row["project_id"]);
            $team_tag->setAttributeNode($project_id);
        }
    }
    $details = $xml->createElement($row["post"], $row["name"]);
    $team_tag->appendChild($details);
}

// for tags under mobdevelopment
$mob_dev_tag = $xml->createElement('mob_development');
$dev_tag->appendChild($mob_dev_tag);
$prj_mgr = new DOMAttr('prj_mgr', $row["project_manager"]);
$mob_dev_tag->setAttributeNode($prj_mgr);

while ($row = mysqli_fetch_assoc($mobdev)) {
    
    $prj_mgr = new DOMAttr('prj_mgr', $row["project_manager"]); //setting the project manager of mob_dev 
    $mob_dev_tag->setAttributeNode($prj_mgr);
    
    $team_tag; // declaring outside the scope of if so that variable can be used later
    if ($row["post"] == "manager") { // when manager comes then create new tag which consist of other tags
        $team_tag = $xml->createElement('team');
        $mob_dev_tag->appendChild($team_tag);
        $team_id = new DOMAttr('mob_dev_id', $row["team_id"]);
        $team_tag->setAttributeNode($team_id);
        
        if (!is_null($row["project_id"])) {
            $project_id = new DOMAttr('project_id', $row["project_id"]);
            $team_tag->setAttributeNode($project_id);
        }
    }
    $details = $xml->createElement($row["post"], $row["name"]);
    $team_tag->appendChild($details);
}

// for all tags under project tag
$projects_tag = $xml->createElement('projects');
$root->appendChild($projects_tag);
while ($row = mysqli_fetch_assoc($project)) {

    $details = $xml->createElement('project');
    $projects_tag->appendChild($details);

    $project_id = new DOMAttr('project_id', $row["project_id"]);
    $details->setAttributeNode($project_id);

    $newDetails = $xml->createElement("name",$row["name"]);
    $details->appendChild($newDetails);

    $otherDetails = $xml->createElement("details",$row["details"]);
    $details->appendChild($otherDetails);
}

echo "<xmp>" . $xml->saveXML() . "</xmp>"; // showing the file
$xml->save('coursework.xml');


?>