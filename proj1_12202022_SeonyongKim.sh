#!/bin/bash
if [ $# -ne 3 ]
then
	echo "usage./2024-OSS-Project1.sh file1 file2 file3"
	exit 1
fi

if [ "$1" != "teams.csv" ] || [ "$2" != "players.csv" ] || [ "$3" != "matches.csv" ]
then
	echo "usage./2024-OSS-Project1.sh file1 file2 file3"
	exit 1
fi

echo "************OSS1 - Project1************"
echo "*         StudentID: 12202022         *"
echo "*           Name : SeonyongKim        *"
echo "***************************************"
stop="N"
until [ "$stop" = "Y" ]
do
	echo "\n[MENU]"
	echo "1. Get the data of Heung-Min Son's Current Club, Appearances, Goals, Assists in players.csv"
	echo "2. Get the team data to enter a league position in teams.csv"
	echo "3. Get the Top-3 Attendance matches in matches.csv"
	echo "4. Get the team's league position and team's top scorer in teams.csv & player.csv"
	echo "5. Get the modified format of data_GMT in matches.csv"
	echo "6. Get the data of winning team by the largest difference on home stadium in teams.csv & matches.csv"
	echo "7. Exit"
	read -p "Enter your CHOICE (1~7) : " ch1
	case "$ch1" in
		1)
			read -p "Do you want to get the Heung-Min Son's data? (y/n) :" ch11
			if [ "$ch11" = "y" ]
			then
				cat players.csv | awk -F, '$1~"Heung"{print $4, $6, $7, $8}' | awk '{print "Team:" $1 " " $2 ", Apperance:" $3 ", Goal:" $4 ", Assist:" $5}'
			fi
			;;
		2)
			read -p "What do you want to get the team data of league_position[1-20]:" ch12
			cat teams.csv | awk -F, -v var="$ch12" '$6==var{print $6 " " $1 " " $2/($2+$3+$4)}'
			;;
		3)
			read -p "Do you want to know Top-3 attendance data? (y/n):" ch13
			if [ "$ch13" = "y" ]
			then
				echo "***Top-3 Attendance Match***"
				cat matches.csv | awk -F, '$2>10000 && $2!~"a"{print $2 "," $0}' | sort -r | awk -F, '{print "\n" $4 " vs " $5 " (" $2 ")" "\n" $3 " " $8}' | head -n 9
			fi
			;;
		4)
			read -p "Do you want to get team's ranking and highest-scoring player? (y/n):" ch14
			if [ "$ch14" = "y" ]
			then
				IFS=,
				team=$(cat teams.csv | awk -F, '$6!~"l"{print $6 "," $1 ","}' | sort -n | awk -F, '{print $1, $2}')
				echo $team | head -n 1 | tail -n 1
				cat players.csv | awk -F, 'NR > 1 && $4~"Manchester City"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo  $team | head -n 2 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"Liverpool"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 3 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"Chelsea"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 4 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"Totten"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 5 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"Arse"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 6 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"Manchester U"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 7 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"Wolver"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 8 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"Everton"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 9 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"Leicester"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 10 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"West"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 11 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"Watf"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 12 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"Crystal"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 13 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"Newca"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 14 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"AFC"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 15 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"Burn"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 16 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"South"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 17 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"Brighton"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 18 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"Cardi"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 19 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"Fulham"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
				echo $team | head -n 20 | tail -n 1
                                cat players.csv | awk -F, 'NR > 1 && $4~"Town"{print $7","$1","$7}' | sort -nr | head -n 1 | awk -F, '{print $2, $1"\n"}'
			fi
			;;
		5)
			read -p "Do you want to modify the format of data? (y/n):" ch15
			if [ "$ch15" = "y" ]
			then
				cat matches.csv | awk -F, '$1!~"date"{print $1}' | sed 's/201[89]//g' | sed 's/ - //g' | sed 's/Aug /2018\/08\//' | sed 's/Sep /2018\/09\//' | sed 's/Oct /2018\/10\//' | sed 's/Nov /2018\/11\//' | sed 's/Dec /2018\/12\//' | sed 's/Jan /2019\/01\//' | sed 's/Feb /2019\/02\//' | sed 's/Mar /2019\/03\//' | sed 's/Apr /2019\/04\//' | sed 's/May /2019\/05\//' | head -n 10
			fi
			;;
		6)
			echo "1) Arsenal               11) Liverpool"
			echo "2) Tottenham Hotspur     12) Chelsea"
			echo "3) Manchester City       13) WestHam United"
			echo "4) Leicester City        14) Watford"
			echo "5) Crystal Palace        15) Newcastle United"
			echo "6) Everton               16) Cardiff City"
			echo "7) Burnley               17) Fulham"
			echo "8) Southampton           18) Brigton & Hove Albion"
			echo "9) AFC Bournemouth       19) Huddersfield Town"
			echo "10) Manchester United    20) Wolverhampton Wanderers"		
			read -p "Enter your team number:" ch16
				team=$(cat teams.csv | awk -F, -v ch16="$ch16" '$1!~"name"{print $1}' | head -n "$ch16" | tail -n 1)
				var=$(cat matches.csv | awk -F, -v team="$team" '$3==team{print $5-$6 "," $0}' |  sort -nr | awk -F, '{print $1}' | head -n 1)
				echo "\n"
				cat matches.csv | awk -F, '{print $5-$6 "," $0}' | sort -nr | awk -F, -v var="$var" -v team="$team" '$1==var && $4==team{print $2 "\n" $4, $6 " vs " $7, $5, "\n"}'

			;;
		7)
			echo "Bye!"
			stop="Y"
			;;
	esac
done
