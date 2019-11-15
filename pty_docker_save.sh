#!/usr/bin/php
<?php
$containerName = $argv[1];
if (!$containerName)
{
	echo "pty_docker_backup version 1.0\n";
	echo "Copyright (C) 2019 by KwangHee Yoo, PLATYHOUSE Co.,LTD.\n";
	echo "Web site: https://www.platyhouse.com/\n\n";
	echo "Usage ./pty_docker_backup.php <containerName>\n";
	echo "=================================\n";
	system ("docker ps -a");
        echo "=================================\n";
	exit;
}

$date = date("Ymd_His");
# =========================
$cmd = "docker commit -p {$containerName} {$containerName}:{$date}";
echo "# {$cmd}\n";; system ($cmd);

$cmd = "docker save ${containerName}:{$date} | gzip > /root/docker_{$containerName}_{$date}.tgz";
echo "# {$cmd}\n";; system ($cmd);
echo "finished";
?>

