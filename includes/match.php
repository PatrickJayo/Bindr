<?php
include("../config/connection.php");
session_start();
$uid = htmlentities($_POST['uid'], ENT_QUOTES);
$pid = htmlentities($_POST['pid'], ENT_QUOTES);

$sql = "SELECT id FROM matches WHERE u_id = :uid AND p_id =:pid";
$matchCheck = $conn->prepare($sql);
$matchCheck->bindParam(':uid',$uid,PDO::PARAM_INT);
$matchCheck->bindParam(':pid',$pid,PDO::PARAM_INT);
$matchCheck->execute();
$matchCheckExist = $matchCheck->rowCount();
if ($matchCheckExist > 0) {
	$add_sql = "DELETE FROM matches WHERE u_id = :uid AND p_id = :pid";
	$add_match = $conn->prepare($add_sql);
	$add_match->bindParam(':uid',$uid,PDO::PARAM_INT);
	$add_match->bindParam(':pid',$pid,PDO::PARAM_INT);
	$add_match->execute();
	echo "<button class='follow_btn' onclick='matchPage(\"$uid\",\"$pid\")' style='width:100%;margin:0px 3px;padding:10px 15px;' title='".lang('matches')."'><span class='fa fa-heart-o' style='color:#bbbbbb;font-size:18px;'></span></button>";
	// Delete notification to user
    $s_id = $_SESSION['id'];
    $notifyType = "heart";
    $sendNotification = $conn->prepare("DELETE FROM notifications WHERE from_id =:from_id AND for_id=:for_id AND notifyType_id=:ntId AND notifyType=:notifyType");
    $sendNotification->bindParam(':from_id',$s_id,PDO::PARAM_INT);
    $sendNotification->bindParam(':for_id',$pid,PDO::PARAM_INT);
    $sendNotification->bindParam(':ntId',$s_id,PDO::PARAM_INT);
    $sendNotification->bindParam(':notifyType',$notifyType,PDO::PARAM_STR);
    $sendNotification->execute();
    // ==================================
}else{
	$add_sql = "INSERT INTO matches (u_id,p_id) VALUES (:uid,:pid)";
	$add_match = $conn->prepare($add_sql);
	$add_match->bindParam(':uid',$uid,PDO::PARAM_INT);
	$add_match->bindParam(':pid',$pid,PDO::PARAM_INT);
	$add_match->execute();
	echo "<button class='follow_btn' onclick='matchPage(\"$uid\",\"$pid\")' style='width:100%;margin:0px 3px;border-color:#ffc107;padding:10px 15px;' title='".lang('unheart')."'><span class='fa fa-heart' style='color:#FFC107;font-size:18px;'></span></button>";
	// send notification to user
    $nId = rand(0,999999999)+time();
    $s_id = $_SESSION['id'];
    $notifyType = "heart";
    $nSeen = "0";
    $nTime = time();
    if ($pid != $s_id) {
    $sendNotification = $conn->prepare("INSERT INTO notifications (n_id, from_id, for_id, notifyType_id, notifyType, seen, time) VALUES (:nId, :fromId, :forId, :notifyTypeId, :notifyType, :seen, :nTime)");
    $sendNotification->bindParam(':nId',$nId,PDO::PARAM_INT);
    $sendNotification->bindParam(':fromId',$s_id,PDO::PARAM_INT);
    $sendNotification->bindParam(':forId',$pid,PDO::PARAM_INT);
    $sendNotification->bindParam(':notifyTypeId',$s_id,PDO::PARAM_INT);
    $sendNotification->bindParam(':notifyType',$notifyType,PDO::PARAM_STR);
    $sendNotification->bindParam(':seen',$nSeen,PDO::PARAM_INT);
    $sendNotification->bindParam(':nTime',$nTime,PDO::PARAM_INT);
    $sendNotification->execute();
    }
    // ==================================
}
exit();
?>