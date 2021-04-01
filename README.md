# Project_1_SQL

Projekt je zameraný na agregovanie premmenných, ktoré môžu mať vplyv na šírenie COVIDU. Projekt som rozdelil do niekoľkých častí. Vytvoril som samostatne 4 tabuľky (***Covid_Time.sql, Economy.sql, Religion.sql, Life_except.sql, Weather.sql***) , z ktorých som vytvoril finálnu tabuľku (***Final.sql***). Všetky tabuľky sú uložené v databázi Engeta. 

## Skript ***Covid_Time.sql***
V tabuľke vytvorenej týmto skriptom, sú uložené údaje o Covide, konkrétne počet nakazených za jednotlivé dni + počet testov. K tomu som pridal binárnu premennú _weekend_ a premennú _Season_. Premenná _weekend_ nadobúda hodnotu 0 počas dňa v týždni a hodnotu 1 cez víkend. Premenná _Season_ nám ukazuje ročné obdobie. Nadobúda hodnotu 0 - zima , 1 - jar, 2 - leto, 3 - jeseň. V tejto premenej taktiež rozlišujem či je krajina na severnej polokouli alebo na južnej polokouli (pomocou priemeru severnej a juznej šírky daného štátu).
Čo sa týka dát tak najviac chýbajúcich hodnôt sa nachádza v premennej _Tests_performed_ , kde chýbajú údaje či už za jednotlivé štáty ale aj za určité dni, ktoré sledujeme.


## Skript ***Economy.sql***
V tejto tabuľke sa nachádzaju data vybraných ekonomických parametrov, medzi ktoré patrí Gini koeficient, HDP na hlavu, detská úmrtnost, populácia , hustota zaľudnenia a mediánovy vek. Najviach chýbajúcich dát bolo v prípade Gini koeficientu, kde nebolo možné nájsť rok v ktorom by bol dostatočný počet dát. Preto sú údaje k jednotlivým krajinám za rôzne roky(posledné známe údaje za jednotlivé krajiny). Síce sú časovo nesúrodé, ale je ich v porovnaní s inými možnosťami najviac. Iná možnosť bola teda využiť dáta za určitý rok (ako najviac vyhovujúci mi príde rok 2015 kde boli údaje k 78 krajinám a daný rok bol v relatívnej blízkej minulosti). Taktiež musím upozorniť, že premenné v tabuľke sú v rôznych časových obdobiach ( HDP na hlavu a detská úmrtnosť za rok 2019 a mediánovy vek za rok 2018). Je to kvôli ne/dostupnosti dát. 
Čo sa týka vplyu na počet pozitívnych testov COVIDU tak predpokladám, že čím vyššia hustota zaľudnenia tak tým rýchlejšie šírenie(väčší počet pozitívnych testov). V opačnom smere môže pôsobiť premenná mediánovy vek, kde predpokladám, že čím je nižší mediánovy vek tak tým je šírenie pomalšie, kedže COVID zasahuje primárne staršie ročníky. HDP na hlavu bude podla mňa mať taktiež negatívny vplyv na širenie COVIDU, ale to len zo statistického hladiska. Je to kvôli tomu, že predpokladám, že "bohatšie" krajiny majú lepšie možnosti testovania oproti tým "chudobnejším" a teda budú vykazovať väčší počet nakazených.


## Skript ***Religion.sql***
V tabuľke sa nachádzajú údaje o relatívnom rozdelení jednotlivých náboženstiev v danej krajine. Výsledné údaje sú v percentách a za rok 2020. Predpokladám, že náboženstvo bude mať minimálny vplyv na šírenie COVIDU a to z toho dôvodu, že krajiny kde pravláda určitý typ náboženstva sú tak rozdielne, že nevznikne žiadna spojitosť medzi náboženstvom a šírenim COVIDU.


## Skript ***Life_except.sql***
Tabuľka pozostáva z troch premenných a to očakávana doba dožitia v roku 2015 a 1965 a rozdiel medzi jednotlivými rokmi. Všetky sledované krajiny zaznamenali rast v očakávanej dobe dožitia. Najväčší nárast sa dá pozorovať medzi africkými a ázijskými krajinami. Najväčší nárast nastal u Malediv.


## Skript ***Weather.sql***
Tabuľka pozostáva z údajov zameraných na počasie. Konkrétne to je priemerná denná teplota, maximálna rýchlosť vetra a počet hodín v ktorých pršalo v daný deň. Priemernú dennú teplotu som vypočítal pomocou priemeru z hodnôt teploty o 6:00,15:00 a 21:00. Pri premmenej počet hodín v ktorých pršalo v daný deň som vychádzal z predpokladu, že keď pršalo napríklad v 15:00 a ďalšie meranie bolo v 18:00 tak pršalo celú dobu medzi meraniami. Druhá možnosť ako to spraviť bolo, že by som počítal len konkrétnu hodinu, kedy bol nameraný dážď.
Vplyv na COVID to môže mať ten, že v dni kde bola priemerná teplota nižšia, upršané dni a silný vietor tak sa ľudia viac zdržovali vo vnútorných priestoroch čo môže viesť k nárastu počtu pozitívnych.


