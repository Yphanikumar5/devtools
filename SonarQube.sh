yum install wget -y
yum install unzip -y
Java()
{
	java -version
	
	if [ $? = 0 ]
		then 
		echo "=========================="
		echo "java is already installed "
		echo "=========================="
		else
		
		 echo 'Java Installation start)'
	    echo '-----------------------'
		cd /opt
		sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.rpm
		sudo yum install jdk-8u181-linux-x64.rpm -y
		echo "export JAVA_HOME=/usr/java/jdk1.8.0_181-amd64" >> /etc/bashrc
        text='export PATH=$PATH:$JAVA_HOME/bin'
        echo "$text" >> /etc/bashrc
        source /etc/bashrc
        echo
        echo "===================="
		echo "JAVA-VERSION"
		echo "===================="
		java -version
		echo 'Java Installation done successfully.)'
	    echo '-----------------------------------'
	fi	
}	
SonarService()
{
	sudo ln -s /home/ec2-user/sonarqube-7.2.1/bin/linux-x86-64/sonar.sh /usr/bin/sonar
	sudo chmod 755 /etc/init.d/sonar
}

Sonarscanner()
	{
		sonar-scanner -v
		if [ $? = 0 ]
		then
		echo
		echo "===================================="
		echo " sonar-scanner is already installed "
		echo "===================================="
		else
		Java
		cd /opt
		echo "SONAR-SCANNER Downloading"
            sudo wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip 
            sudo unzip sonar-scanner-cli-3.2.0.1227-linux.zip
	    	echo "export SONAR_SCANNER=/opt/sonar-scanner-3.2.0.1227-linux" >> /etc/bashrc
	    	text='export PATH=$PATH:$SONAR_SCANNER/bin'
            echo "$text" >> /etc/bashrc
            source /etc/bashrc
            echo
            echo "===================="
			echo "SONAR-SCANNER-VERSION"
			echo "===================="
			sonar-scanner -v
		fi
	}
Sonarqube()
	{
		if [ -e /home/ec2-user/sonarqube-7.2.1 ]
		then 
		echo
		echo "================================"
		echo " Sonarqube is already installed "
		echo "================================"
		else
		Sonarscanner
		Java
		cd /home/ec2-user
		echo "Sonarqube Downloading"
            wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-7.2.1.zip
            unzip sonarqube-7.2.1.zip
			sudo chmod -R 777 sonarqube-7.2.1
			SonarService
		fi
	}
	echo "Slect a Option "
	echo " 1. Install Sonarqube "
	echo " 2. Start the Sonarqube "
	echo " 3. Stop the Sonarqube"
	echo " 4. Status of the Sonarqube"
	echo " 5. Restart Sonarqube"
	echo " Enter a Number "
	read qube
	case $qube in
	1)
		Sonarqube
		;;
	2)
		cd /home/ec2-user/sonarqube-7.2.1
		sudo rm -rf temp 
		 service sonar start
		;;
	3)
		 service sonar stop
		;;
	4)
		 service sonar status
		;;
	5)
		service sonar restart
		;;
	*)
	echo " Please Enter a valid Number "
	;;
	esac
	
	
	