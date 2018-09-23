apt-get update -y
apt-get install wget -y
apt-get install unzip -y
Versions()
 {
	source ~/.bashrc

echo
echo "===================="
echo "JAVA-VERSION"
echo "===================="
java -version
echo
echo "===================="
echo "ANT-VERSION"
echo "===================="
ant -version
echo
echo "===================="
echo "MAVEN-VERSION"
echo "===================="
mvn -version
echo
echo "===================="
echo "SONAR-SCANNER-VERSION"
echo "===================="
sonar-scanner -v
echo
echo "===================="
echo "DOCKER-VERSION"
echo "===================="
docker --version
echo
echo "===================="
echo "ANSIBLE-VERSION"
echo "===================="
ansible --version
echo
echo "===================="
echo "GIT-VERSION"
echo "===================="
git --version
 }

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
		add-apt-repository ppa:webupd8team/java
		apt-get install oracle-java8-installer


        echo
        echo "===================="
		echo "JAVA-VERSION"
		echo "===================="
		java -version
		echo 'Java Installation done successfully.)'
	    echo '-----------------------------------'
	fi	
}

Ant()
	{
		ant -version
		if [ $? = 0 ]
		then 
		echo "========================="
		echo "Ant is already installed "
		echo "========================="
		else 
		Java
		cd /opt
			echo "ANT Downloading"
	    	wget http://www-eu.apache.org/dist//ant/binaries/apache-ant-1.10.5-bin.zip -O apache-ant-1.10.5.zip
	    	unzip apache-ant-1.10.5.zip
	    	echo "export ANT_HOME=/opt/apache-ant-1.10.5" >> ~/.bashrc
	    	text='export PATH=$PATH:$ANT_HOME/bin'
            echo "$text" >> ~/.bashrc
            source ~/.bashrc
            echo
            echo "===================="
			echo "ANT-VERSION"
			echo "===================="
			ant -version
			fi
	}
Maven()
	{
		mvn -version
		if [ $? = 0 ]
			then 
			echo "==========================="
			echo "Maven is already installed "
			echo "==========================="
			else
			Java
			cd /opt
			echo "MAVEN Downloading"
            wget http://www-eu.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.zip -O apache-maven-3.5.4.zip
            unzip apache-maven-3.5.4.zip
	    	echo "export M2_HOME=/opt/apache-maven-3.5.4" >> ~/.bashrc
	    	text='export PATH=$PATH:$M2_HOME/bin'
            echo "$text" >> ~/.bashrc
            source ~/.bashrc
            echo
            echo "===================="
			echo "MAVEN-VERSION"
			echo "===================="
			mvn -version
			fi
	}
Tomcat()
	{	
		if [ -e /opt/apache-tomcat-8.0.53 ]
			then
			echo
			echo "=========================="
			echo " tomcat already installed "
			echo "=========================="
			else
		Java
		cd /opt
		echo "Tomcat Downloading"
            wget http://redrockdigimark.com/apachemirror/tomcat/tomcat-8/v8.0.53/bin/apache-tomcat-8.0.53.tar.gz
            tar -zxvf apache-tomcat-8.0.53.tar.gz
			fi
	}
Wildfly()
	{	
		if [ -e /opt/wildfly-13.0.0.Final ]
			then 
			echo
			echo "============================="
			echo " Wildfly is already installed "
			echo "============================="
			else
		Java
		cd /opt
		echo "WildFly Downloading"
            wget http://download.jboss.org/wildfly/13.0.0.Final/wildfly-13.0.0.Final.tar.gz
            tar -zxvf wildfly-13.0.0.Final.tar.gz
			fi
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
            wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip 
            unzip sonar-scanner-cli-3.2.0.1227-linux.zip
	    	echo "export SONAR_SCANNER=/opt/sonar-scanner-3.2.0.1227-linux" >> ~/.bashrc
	    	text='export PATH=$PATH:$SONAR_SCANNER/bin'
            echo "$text" >> ~/.bashrc
            source ~/.bashrc
            echo
            echo "===================="
			echo "SONAR-SCANNER-VERSION"
			echo "===================="
			sonar-scanner -v
		fi
	}
Sonarqube()
	{
		if [ -e /opt/sonarqube-7.2.1 ]
		then 
		echo
		echo "================================"
		echo " Sonarqube is already installed "
		echo "================================"
		else
		Sonarscanner
		Java
		cd /opt
		echo "Sonarqube Downloading"
            wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-7.2.1.zip
            unzip sonarqube-7.2.1.zip
		fi
	}
Nexus()
 {
	if [ -e /opt/nexus-master ]
	then 
	echo
	echo "==========================="
	echo " Nexus is already installed "
	echo "==========================="
	else
	Java
	cd /opt
	echo "Nexus Downloading"
			wget https://github.com/madhu532/nexus/archive/master.zip
			unzip master.zip
	fi
 }
Jfrog()
 {
	if [ -e /opt/artifactory-oss-6.1.0 ]
	then 
	echo
	echo "==========================="
	echo " jfrog is already installed "
	echo "==========================="
	else
	Java
	cd /opt
	echo "JFrog Downloading"
			wget https://bintray.com/jfrog/artifactory/download_file?file_path=jfrog-artifactory-oss-6.1.0.zip
			unzip download_file?file_path=jfrog-artifactory-oss-6.1.0.zip
	fi
 }
 Jenkins()
	{
		service jenkins status
		if [ $? = 0 ]
		then
		echo
		echo "============================="
		echo " Jenkins is already installed "
		echo "============================="
		else
		echo " installing the jenkins "
		Java
		cd /tmp && wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

		echo 'deb https://pkg.jenkins.io/debian-stable binary/' | sudo tee -a /etc/apt/sources.list.d/jenkins.list

		sudo apt update
		sudo apt install jenkins
		sudo systemctl stop jenkins.service
		sudo systemctl start jenkins.service
		sudo systemctl enable jenkins.service
		fi
	}
Docker()
	{
		docker --version
		if [ $? = 0 ]
		then 
		echo
		echo "============================"
		echo " Docker is already installed "
		echo "============================"
		else
		echo 'Docker Installation started.)'
        echo '-----------------------------'
            cd / 

           
		apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
		add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

 apt install docker.io


			docker --version

			sudo systemctl status docker
			sudo systemctl start docker

			echo 'Docker Installation done successfully.)'
			echo '---------------------------------------'
			echo
			echo "===================="
			echo "DOCKER-VERSION"
			echo "===================="
			docker --version
			fi
	}
Ansible()
	{
		ansible --version
		if [ $? = 0 ]
		then
		echo
		echo "============================="
		echo " Ansible is already installed "
		echo "============================="
		else
		echo 'Ansible Installation started.)'
		echo '------------------------------'
			cd /

			rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

			apt-get install ansible -y

			ansible --version

		echo 'Ansible Installation done successfully.)'
		echo '----------------------------------------'
        echo
		echo "===================="
		echo "ANSIBLE-VERSION"
		echo "===================="
		ansible --version
		fi
		
	}
Git()
	{
		git --version
		if [ $? = 0 ]
		then
		echo
		echo "========================="
		echo " Git is already installed "
		echo "========================="
		else
		 echo 'Git Installation started.)'
		echo '-------------------------'

		cd /opt
		apt-get groupinstall "Development Tools" -y
		apt-get install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel curl-devel -y
		apt-get install wget -y
		wget https://github.com/git/git/archive/v2.18.0.tar.gz -O git-bash.tar.gz
		tar -zxf git-bash.tar.gz
		cd git-2.18.0
		make configure
		./configure --prefix=/usr/local
		make install
		git --version
		git config --global user.name "Mithun Technologies"
		git config --global user.email "devopstrainingblr@gmail.com"
		git config --list	    
		echo
		echo "===================="
		echo "GIT-VERSION"
		echo "===================="
		git --version

        echo 'Git Installation done successfully.)'
        echo '-----------------------------------'
		fi
	}
	echo "=================================================="
	echo " Please Enter a number which tool you want install "
	echo "=================================================="
	echo " 0.Check all Versions"
	echo " 1.Install all tools "
	echo " 2.Java "
	echo " 3.Ant "
	echo " 4.Maven"
	echo " 5.Tomcat"
	echo " 6.WildFly"
	echo " 7.Sonarqube "
	echo " 8.Nexus "
	echo " 9.JFrog "
	echo " 10.Jenkins "
	echo " 11.Docker "
	echo " 12.Ansible "
	echo " 13.Git "
	echo "----------------"
	echo " Enter a Number "
	echo "----------------"
	
	
  read TOOLS
  case $TOOLS in
  0)
	Versions
	;;
  1)
	Java
	Ant
	Maven
	Tomcat
	Wildfly
	Sonarqube
	Nexus
	Jfrog
	Jenkins
	Docker
	Ansible
	Git
	echo "==========================================================================================="
	echo " please execute " source ~/.bashrc " command manually after completion of the installion "
	echo "==========================================================================================="
	;;
 2)
	Java
	echo "==========================================================================================="
	echo " please execute " source ~/.bashrc " command manually after completion of the installion "	
	echo "==========================================================================================="
	;;
 3)
	Ant
	echo "==========================================================================================="
	echo " please execute " source ~/.bashrc " command manually after completion of the installion "	
	echo "==========================================================================================="
	;;
 4)
	Maven
	echo "==========================================================================================="
	echo " please execute " source ~/.bashrc " command manually after completion of the installion "
	echo "==========================================================================================="
	;;
 5)
	Tomcat
	;;
 6)
	Wildfly
	;;
 7)
	Sonarqube
	echo "==========================================================================================="
	echo " please execute " source ~/.bashrc " command manually after completion of the installion "
	echo "==========================================================================================="
	;;
 8)
	Nexus
	;;
 9)
	Jfrog
	;;
 10)
	Jenkins
	;;
 11)
	Docker
	;;
 12)
	Ansible
	;;
 13)
	Git
	;;
 *)
 echo " Please Enter a valid Number "
 ;;
 esac
