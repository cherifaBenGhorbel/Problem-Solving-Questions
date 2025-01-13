I - FIRST PART
    1 - retrieving the corresponding crime scene report from the police department’s database
        SELECT * 
        FROM crime_scene_report
        WHERE type = "murder" and date = "20180115" and city = "SQL City"

    2 - retrieving the interview transcript for the 2 witnesses

        2.1 - retrieving the interview transcript for The first witness
            SELECT *
            FROM person
            where address_street_name = "Northwestern Dr" and address_number = 
            (   
                select MAX(address_number) 
                FROM person
            )
                    
        2.2 - retrieving the interview transcript for The second witness
            SELECT *
            FROM person
            where address_street_name = "Franklin Ave" and name like "%Annabel%"

    3 - retrieving the interview transcript for the 2 witnesses

        3.1 - retrieving the interview transcript for The first witness 'Morty Schapiro' whose id is 14887
            SELECT *
            FROM interview
            where person_id = 14887

        3.2 - retrieving the interview transcript for The second witness 'Annabel Miller' whose id is 16371
            SELECT *
            FROM interview
            where person_id = 16371

    4. finding the murdrer based on the transcript of the 2 witnesses

        first witness transcript :
        I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".
        second witness transcript :
        I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

        4.1 - finding the murdrer based on the transcript of the first witnesses
            SELECT *
            FROM person p
            JOIN drivers_license d ON p.license_id = d.id
            JOIN get_fit_now_member gm ON p.id = gm.person_id
            JOIN get_fit_now_check_in gc ON gm.id = gc.membership_id
            WHERE d.plate_number LIKE "%H42W%" and membership_id like "48Z%" and membership_status = "gold" ;

        4.2 - finding the murdrer based on the transcript of the second witnesses
            SELECT *
            FROM get_fit_now_check_in
            WHERE check_in_date = 20180109 ;

        4.3 - seeing if the murderer is the same person
            SELECT *
            FROM person p
            JOIN drivers_license d ON p.license_id = d.id
            JOIN get_fit_now_member gm ON p.id = gm.person_id
            JOIN get_fit_now_check_in gc ON gm.id = gc.membership_id
            WHERE d.plate_number LIKE "%H42W%" and membership_id like "48Z%" and membership_status = "gold" and check_in_date = 20180109 ;

        4.4 - finding the murderer
            INSERT INTO solution VALUES (1, 'Jeremy Bowers');
                    SELECT value FROM solution;

II - finding the real villain behind this crime
    1 - Checking the interview of Jeremy Bowers
        SELECT *
        FROM interview
        WHERE person_id = 67318;

    2 - Finding the accomplice based on the interview of Jeremy Bowers
        SELECT *
        from person p  
        JOIN drivers_license d ON p.license_id = d.id
        JOIN facebook_event_checkin fc On p.id = fc.person_id
        where gender = "female" and height between 65 and 67 and hair_color = "red" and car_model = "Model S" and event_name = "SQL Symphony Concert" and date between 20171201 and 20171231   
    
    3 - Finding the accomplice
        INSERT INTO solution VALUES (1, 'Miranda Priestly');
        
            SELECT value FROM solution;