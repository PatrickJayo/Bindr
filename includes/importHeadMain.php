<?php
if (is_dir("imgs/")) {
    $directoryPath = "";
}elseif (is_dir("../imgs/")) {
    $directoryPath = "../";
}elseif (is_dir("../../imgs/")) {
    $directoryPath = "../../";
}

// set user online >>> I wrote this code here cuz 'head imports' can access any page
if (isset($_SESSION['Username'])) {
$myid = $_SESSION['id'];
$online_status = "1";
$setStatus = $conn->prepare("UPDATE signup SET online = :online_status WHERE id = :myid");
$setStatus->bindParam(':online_status',$online_status,PDO::PARAM_INT);
$setStatus->bindParam(':myid',$myid,PDO::PARAM_INT);
$setStatus->execute();
}
?>
<script type="text/javascript">
window.onbeforeunload = function(){
    var st = "0";
    $.ajax({
        type: "POST",
        url: "<?php echo $directoryPath; ?>includes/userStatus.php",
        data: {'st':st}
    });
}
</script>
<link rel='shortcut icon' type='image/x-icon' href='<? echo $directoryPath ?>imgs/favicon.ico' />
<link rel="stylesheet" href="<?php echo $directoryPath; ?>css/style.css" />
<link rel="stylesheet" type="text/css" href="<?php echo $directoryPath; ?>css/font-awesome-4.5.0/css/font-awesome.min.css">
<script src="<?php echo $directoryPath; ?>js/jquery.min.js"></script>
<script src="<?php echo $directoryPath; ?>js/jquery.form.min.js"></script>
<link rel="stylesheet" href="<?php echo $directoryPath; ?>css/bootstrap.min.css">
<script src="<?php echo $directoryPath; ?>js/bootstrap.min.js"></script>
<script src="<?php echo $directoryPath; ?>js/code.js"></script>
<script type="text/javascript" src="<?php echo $directoryPath; ?>js/jquery.maxlength.js"></script>
<div id="lightboxImg_myModal" class="lightboxImg_modal" onclick="lightboxClose()">
  <span class="lightboxImgClose" onclick="lightboxClose()">&times;</span>
  <img class="lightboxImg_modal_content" id="lightboxImg_photo">
</div>