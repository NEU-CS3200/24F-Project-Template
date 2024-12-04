USE SyncSpace;
-- 1. CityCommunity Data (no dependencies)
insert into CityCommunity (Location) values ('San Francisco');
insert into CityCommunity (Location) values ('San Jose');
insert into CityCommunity (Location) values ('Los Angeles');
insert into CityCommunity (Location) values ('London');
insert into CityCommunity (Location) values ('Boston');
insert into CityCommunity (Location) values ('New York City');
insert into CityCommunity (Location) values ('Chicago');
insert into CityCommunity (Location) values ('Seattle');
insert into CityCommunity (Location) values ('D.C.');
insert into CityCommunity (Location) values ('Atlanta');

-- 2. Housing Data (depends on CityCommunity)
insert into Housing (Availability, Style, CommunityID) values ('Pending Approval', 'Apartment', 7);
insert into Housing (Availability, Style, CommunityID) values ('Pending Approval', 'Apartment', 3);
insert into Housing (Availability, Style, CommunityID) values ('Occupied', 'House', 2);
insert into Housing (Availability, Style, CommunityID) values ('Occupied', 'Dorm', 2);
insert into Housing (Availability, Style, CommunityID) values ('Pending Approval', 'Apartment', 10);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'Apartment', 2);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'Dorm', 10);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'House', 4);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'Dorm', 9);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'House', 5);
insert into Housing (Availability, Style, CommunityID) values ('Pending Approval', 'House', 3);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'Apartment', 6);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'Dorm', 9);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'Dorm', 5);
insert into Housing (Availability, Style, CommunityID) values ('Occupied', 'Apartment', 6);
insert into Housing (Availability, Style, CommunityID) values ('Occupied', 'House', 9);
insert into Housing (Availability, Style, CommunityID) values ('Occupied', 'House', 10);
insert into Housing (Availability, Style, CommunityID) values ('Occupied', 'House', 5);
insert into Housing (Availability, Style, CommunityID) values ('Occupied', 'House', 10);
insert into Housing (Availability, Style, CommunityID) values ('Pending Approval', 'Dorm', 9);
insert into Housing (Availability, Style, CommunityID) values ('Occupied', 'House', 4);
insert into Housing (Availability, Style, CommunityID) values ('Occupied', 'Dorm', 9);
insert into Housing (Availability, Style, CommunityID) values ('Pending Approval', 'Apartment', 7);
insert into Housing (Availability, Style, CommunityID) values ('Occupied', 'Dorm', 4);
insert into Housing (Availability, Style, CommunityID) values ('Pending Approval', 'House', 10);
insert into Housing (Availability, Style, CommunityID) values ('Pending Approval', 'Dorm', 9);
insert into Housing (Availability, Style, CommunityID) values ('Pending Approval', 'House', 3);
insert into Housing (Availability, Style, CommunityID) values ('Pending Approval', 'House', 5);
insert into Housing (Availability, Style, CommunityID) values ('Occupied', 'Apartment', 4);
insert into Housing (Availability, Style, CommunityID) values ('Pending Approval', 'Dorm', 5);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'Dorm', 2);
insert into Housing (Availability, Style, CommunityID) values ('Occupied', 'Apartment', 5);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'House', 4);
insert into Housing (Availability, Style, CommunityID) values ('Pending Approval', 'Dorm', 8);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'Apartment', 10);
insert into Housing (Availability, Style, CommunityID) values ('Pending Approval', 'Apartment', 6);
insert into Housing (Availability, Style, CommunityID) values ('Occupied', 'Apartment', 5);
insert into Housing (Availability, Style, CommunityID) values ('Pending Approval', 'House', 7);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'House', 6);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'House', 7);
insert into Housing (Availability, Style, CommunityID) values ('Pending Approval', 'House', 9);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'House', 3);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'House', 7);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'Dorm', 10);
insert into Housing (Availability, Style, CommunityID) values ('Pending Approval', 'Apartment', 2);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'Apartment', 1);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'House', 5);
insert into Housing (Availability, Style, CommunityID) values ('Occupied', 'House', 10);
insert into Housing (Availability, Style, CommunityID) values ('Occupied', 'Dorm', 1);
insert into Housing (Availability, Style, CommunityID) values ('Vacant', 'House', 4);

-- 3. User Data (no dependencies)
insert into User (Name, Email, Role, PermissionsLevel) values ('Michael Ortega', 'miortega@wikispaces.com', 'System Administrator', 'admin');
insert into User (Name, Email, Role, PermissionsLevel) values ('Mira Lynock', 'mlynock1@webnode.com', 'IT Administrator', 'admin');
insert into User (Name, Email, Role, PermissionsLevel) values ('Caro Molnar', 'cmolnar2@digg.com', 'IT Administrator', 'limited');
insert into User (Name, Email, Role, PermissionsLevel) values ('Christos Boulsher', 'cboulsher3@admin.ch', 'System Administrator', 'guest');
insert into User (Name, Email, Role, PermissionsLevel) values ('Jess Leneve', 'jleneve4@archive.org', 'IT Administrator', 'user');
insert into User (Name, Email, Role, PermissionsLevel) values ('Jordan Harfoot', 'jharfoot5@1688.com', 'IT Administrator', 'admin');
insert into User (Name, Email, Role, PermissionsLevel) values ('Yorke Leyzell', 'yleyzell6@cmu.edu', 'Network Administrator', 'guest');
insert into User (Name, Email, Role, PermissionsLevel) values ('Sigrid Kigelman', 'skigelman7@washington.edu', 'System Administrator', 'user');
insert into User (Name, Email, Role, PermissionsLevel) values ('Feodora Blackaller', 'fblackaller8@usnews.com', 'Network Administrator', 'user');
insert into User (Name, Email, Role, PermissionsLevel) values ('Ambrose Jeandon', 'ajeandon9@unicef.org', 'Network Administrator', 'guest');
insert into User (Name, Email, Role, PermissionsLevel) values ('Spence Chastey', 'schasteya@china.com.cn', 'System Administrator', 'admin');
insert into User (Name, Email, Role, PermissionsLevel) values ('Eartha Colqueran', 'ecolqueranb@apple.com', 'System Administrator', 'admin');
insert into User (Name, Email, Role, PermissionsLevel) values ('Kinna Woolsey', 'kwoolseyc@homestead.com', 'IT Administrator', 'moderator');
insert into User (Name, Email, Role, PermissionsLevel) values ('Nathan Tolworthie', 'ntolworthied@spotify.com', 'System Administrator', 'admin');
insert into User (Name, Email, Role, PermissionsLevel) values ('Diane Cancellieri', 'dcancellierie@qq.com', 'Network Administrator', 'limited');
insert into User (Name, Email, Role, PermissionsLevel) values ('Horatio Purdon', 'hpurdonf@histats.com', 'IT Administrator', 'guest');
insert into User (Name, Email, Role, PermissionsLevel) values ('Elvin Danes', 'edanesg@japanpost.jp', 'Network Administrator', 'moderator');
insert into User (Name, Email, Role, PermissionsLevel) values ('Dori Callow', 'dcallowh@mac.com', 'IT Administrator', 'user');
insert into User (Name, Email, Role, PermissionsLevel) values ('Ediva Malter', 'emalteri@craigslist.org', 'IT Administrator', 'admin');
insert into User (Name, Email, Role, PermissionsLevel) values ('Lyn Paskerful', 'lpaskerfulj@yellowpages.com', 'System Administrator', 'admin');
insert into User (Name, Email, Role, PermissionsLevel) values ('Arleta Clayden', 'aclaydenk@discovery.com', 'System Administrator', 'guest');
insert into User (Name, Email, Role, PermissionsLevel) values ('Marietta Ropars', 'mroparsl@purevolume.com', 'Network Administrator', 'moderator');
insert into User (Name, Email, Role, PermissionsLevel) values ('Brade O''Rodane', 'borodanem@sohu.com', 'Network Administrator', 'admin');
insert into User (Name, Email, Role, PermissionsLevel) values ('Cammy Crichmere', 'ccrichmeren@mediafire.com', 'Network Administrator', 'user');
insert into User (Name, Email, Role, PermissionsLevel) values ('Elwira Szymanzyk', 'eszymanzyko@noaa.gov', 'System Administrator', 'limited');
insert into User (Name, Email, Role, PermissionsLevel) values ('Lorenzo Duerdin', 'lduerdinp@java.com', 'System Administrator', 'moderator');
insert into User (Name, Email, Role, PermissionsLevel) values ('Austin Latchmore', 'alatchmoreq@pen.io', 'IT Administrator', 'user');
insert into User (Name, Email, Role, PermissionsLevel) values ('Park Brettell', 'pbrettellr@reddit.com', 'Network Administrator', 'guest');
insert into User (Name, Email, Role, PermissionsLevel) values ('Bess MacMichael', 'bmacmichaels@spotify.com', 'System Administrator', 'user');
insert into User (Name, Email, Role, PermissionsLevel) values ('Pedro Gatherer', 'pgatherert@vkontakte.ru', 'IT Administrator', 'user');


-- 4. Advisor Data (no dependencies)
insert into Advisor (Name, Email, Department) values ('John Smith', 'jsmith@university.edu', 'Computer Science');
insert into Advisor (Name, Email, Department) values ('Sarah Johnson', 'sjohnson@university.edu', 'Engineering');
insert into Advisor (Name, Email, Department) values ('Jessica Doofenshmirtz', 'gmccard0@nps.gov', 'Khoury College');
insert into Advisor (Name, Email, Department) values ('Babbette Marle', 'bmarle1@bbc.co.uk', 'College of Engineering');
insert into Advisor (Name, Email, Department) values ('Lena Graver', 'lgraver2@creativecommons.org', 'D''Amore Mc-Kim');
insert into Advisor (Name, Email, Department) values ('Kevina Garden', 'kgarden3@sina.com.cn', 'College of Science');
insert into Advisor (Name, Email, Department) values ('Cathryn Tatershall', 'ctatershall4@free.fr', 'Bouve College');
insert into Advisor (Name, Email, Department) values ('Domingo Stanlick', 'dstanlick5@arstechnica.com', 'College of Science');
insert into Advisor (Name, Email, Department) values ('Joyous Ferby', 'jferby6@yahoo.com', 'Khoury College');
insert into Advisor (Name, Email, Department) values ('Thibaut Biles', 'tbiles7@4shared.com', 'College of Engineering');
insert into Advisor (Name, Email, Department) values ('Tana Roblou', 'troblou8@cargocollective.com', 'D''Amore Mc-Kim');
insert into Advisor (Name, Email, Department) values ('Sheridan Gunny', 'sgunny9@arizona.edu', 'College of Science');

-- 5. Student Data (depends on CityCommunity, Housing, and Advisor)
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Delphinia Spiers', 'Physics', 'Microsoft', 'San Francisco', 'Searching for Housing', 'Has Car', 1200, '1 year', 4, 'Energetic', 35, 1, 'Is a member of the school drama club and performs in plays', 7, 7, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Emanuel Keppy', 'Business', 'Tesla', 'San Francisco', 'Searching for Housing', 'Has Car', 2100, '6 months', 4, 'Vibrant', 45, 4, 'Loves to watch documentaries about space and the universe', 10, 4, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Mirna Tomaini', 'Finance', 'Boeing', 'London', 'Searching for Roommates', 'Has Car', 1000, '4 months', 1, 'Active', 15, 3, 'Is a talented singer and performs in school musicals', 2, 5, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Noemi Puckring', 'Music', 'Costco', 'Atlanta', 'Searching for Housing', 'Has Car', 2000, '4 months', 5, 'Relaxed', 15, 6, 'Enjoys birdwatching and learning about different species', 5, 7, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Keven Rosen', 'Chemistry', 'IKEA', 'San Francisco', 'Complete', 'Has Car', 1300, '6 months', 3, 'Relaxed', 25, 3, 'Is a member of the school debate team and loves to argue their point', 4, 2, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Phyllida Rubert', 'Marketing', 'ExxonMobil', 'New York City', 'Searching for Housing', 'Complete', 1400, '1 year', 1, 'Energetic', 20, 6, 'Is a talented singer and performs in school musicals', 2, 4, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Neall Gwillym', 'Engineering', 'Northrop Grumman', 'Atlanta', 'Searching for Housing', 'Searching for Carpool', 1300, '6 months', 5, 'Balanced', 30, 4, 'Enjoys stargazing and learning about astronomy', 5, 8, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Schuyler Uppett', 'Chemistry', 'Johnson & Johnson', 'Los Angeles', 'Complete', 'Has Car', 1100, '6 months', 5, 'Carefree', 30, 3, 'Dreams of becoming a famous actor and starring in movies', 3, 2, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Sophie O''Shee', 'Data Science', 'Boeing', 'London', 'Complete', 'Complete', 2000, '1 year', 4, 'Relaxed', 15, 3, 'Wants to become a doctor and help people in need', 8, 5, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Rosana Wolters', 'Physics', 'Goldman Sachs', 'New York City', 'Searching for Roommates', 'Has Car', 1900, '4 months', 1, 'Active', 35, 4, 'Is a member of the school photography club and loves to take pictures', 8, 6, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Mignonne Whetson', 'Engineering', 'Bank of America', 'New York City', 'Complete', 'Complete', 1800, '1 year', 5, 'Carefree', 45, 6, 'Is passionate about environmental conservation and volunteers for clean-up projects', 4, 2, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Tyson Gallant', 'Data Science', 'Citigroup', 'Los Angeles', 'Searching for Roommates', 'Has Car', 1400, '4 months', 1, 'Eco-friendly', 25, 3, 'Loves to watch nature documentaries and learn about wildlife', 5, 9, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Tara Heineke', 'Biology', 'AstraZeneca', 'Los Angeles', 'Searching for Roommates', 'Complete', 2300, '6 months', 1, 'Social', 15, 1, 'Wants to learn how to surf and ride the waves', 8, 7, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Ilka Siverns', 'Music', 'Lockheed Martin', 'San Jose', 'Searching for Roommates', 'Has Car', 2400, '1 year', 1, 'Carefree', 35, 4, 'Dreams of opening a bakery and sharing their love of baking with others', 10, 3, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Georgie Lohrensen', 'History', 'IKEA', 'San Jose', 'Searching for Roommates', 'Complete', 1000, '4 months', 1, 'Energetic', 10, 6, 'Loves to watch documentaries and learn about history', 6, 2, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Therese Winsborrow', 'Finance', 'Hyundai', 'Seattle', 'Searching for Roommates', 'Has Car', 1300, '6 months', 5, 'Sustainable', 35, 1, 'Loves to go camping and spend time in the great outdoors', 10, 3, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Chance Touret', 'Chemistry', 'Merck & Co.', 'London', 'Complete', 'Searching for Carpool', 1000, '4 months', 5, 'Balanced', 30, 2, 'Enjoys learning about different cultures and traditions', 7, 9, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Deirdre Trevain', 'Public Health', 'BP', 'London', 'Searching for Roommates', 'Has Car', 1800, '6 months', 1, 'Carefree', 25, 5, 'Is a member of the school drama club and performs in plays', 2, 9, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Jeremias Brickham', 'Physics', 'Citigroup', 'San Jose', 'Searching for Housing', 'Searching for Carpool', 1300, '1 year', 3, 'Outgoing', 30, 1, 'Dreams of becoming a famous actor and starring in movies', 8, 7, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Richmound Golagley', 'Finance', 'Unilever', 'San Francisco', 'Searching for Roommates', 'Complete', 1600, '1 year', 5, 'Carefree', 45, 2, 'Is a talented artist and loves to create beautiful paintings', 4, 2, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Florette Goodinge', 'Data Science', 'Chevron', 'London', 'Complete', 'Searching for Carpool', 2300, '6 months', 3, 'Holistic', 45, 3, 'Loves to read adventure stories', 4, 4, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Ogden Skydall', 'Data Science', 'Morgan Stanley', 'D.C.', 'Complete', 'Complete', 1800, '1 year', 4, 'Healthy', 30, 6, 'Wants to learn how to skateboard and do tricks at the skate park', 4, 5, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Donall Tankin', 'Engineering', 'Walt Disney Company', 'New York City', 'Complete', 'Has Car', 2000, '4 months', 4, 'Nomadic', 15, 3, 'Is a member of the school newspaper and loves to write articles', 1, 7, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Gustav Grzegorczyk', 'Marketing', 'Target', 'Seattle', 'Complete', 'Has Car', 1900, '1 year', 5, 'Carefree', 45, 3, 'Enjoys playing board games with friends and family', 5, 7, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Johny Murdy', 'Music', 'Home Depot', 'Atlanta', 'Complete', 'Searching for Carpool', 1200, '1 year', 2, 'Nomadic', 20, 4, 'Wants to start a blog and share their thoughts with the world', 3, 4, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Zolly Boundey', 'Data Science', 'JPMorgan Chase', 'Chicago', 'Complete', 'Complete', 1600, '6 months', 1, 'Active', 10, 4, 'Is a member of the school drama club and performs in plays', 2, 9, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Colette Fritter', 'Chemistry', 'Morgan Stanley', 'New York City', 'Searching for Roommates', 'Complete', 1100, '4 months', 1, 'Nomadic', 20, 4, 'Is a talented dancer and performs in recitals', 8, 3, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Herb Goodchild', 'Computer Science', 'Siemens Energy', 'Los Angeles', 'Complete', 'Searching for Carpool', 1000, '4 months', 4, 'Social', 30, 5, 'Dreams of becoming a professional athlete and playing in the Olympics', 2, 3, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Tully Gautrey', 'English', 'AstraZeneca', 'San Jose', 'Searching for Housing', 'Searching for Carpool', 1400, '1 year', 5, 'Eco-friendly', 10, 5, 'Wants to learn how to dance salsa and perform at dance competitions', 5, 7, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Hyacinthie Malia', 'Chemistry', 'Mercedes-Benz', 'Boston', 'Searching for Housing', 'Has Car', 1400, '1 year', 3, 'Social', 25, 4, 'Enjoys photography and capturing beautiful moments', 8, 4, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Claudianus Bartholomew', 'Biology', 'Amazon', 'Los Angeles', 'Complete', 'Has Car', 2400, '4 months', 1, 'Healthy', 15, 2, 'Wants to learn how to skateboard and do tricks at the skate park', 1, 2, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Casar Kuschek', 'Computer Science', 'BP', 'Boston', 'Complete', 'Complete', 1900, '1 year', 3, 'Eco-friendly', 15, 1, 'Enjoys playing board games with friends and family', 10, 4, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Urbano Urlich', 'Business', 'Procter & Gamble', 'San Jose', 'Searching for Roommates', 'Searching for Carpool', 1500, '6 months', 5, 'Sustainable', 30, 6, 'Enjoys volunteering at the animal shelter and caring for pets', 5, 6, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Clarine Sikora', 'Music', 'Pfizer', 'Seattle', 'Searching for Roommates', 'Complete', 1000, '4 months', 3, 'Healthy', 30, 4, 'Dreams of becoming a famous chef and opening their own restaurant', 5, 4, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Brandon Arnaez', 'Business', 'NBCUniversal', 'D.C.', 'Complete', 'Complete', 1200, '4 months', 4, 'Carefree', 30, 4, 'Is passionate about fashion and loves to create their own outfits', 5, 8, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Dagny Strongman', 'History', 'Ford', 'Chicago', 'Complete', 'Complete', 2400, '1 year', 2, 'Balanced', 35, 5, 'Wants to travel the world and learn about different cultures', 5, 9, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Barnaby Gilluley', 'Biology', 'Siemens Energy', 'Boston', 'Searching for Roommates', 'Searching for Carpool', 2300, '6 months', 2, 'Eco-friendly', 30, 6, 'Dreams of becoming a professional athlete and competing in the Olympics', 7, 8, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Victoria Cocher', 'Music', 'IKEA', 'New York City', 'Searching for Housing', 'Has Car', 1000, '4 months', 5, 'Sustainable', 10, 6, 'Is a member of the school debate team and loves to argue their point', 9, 8, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Emery Rogeron', 'Biology', 'Amazon', 'New York City', 'Searching for Housing', 'Searching for Carpool', 2200, '6 months', 1, 'Healthy', 15, 5, 'Wants to learn how to code and create their own video games', 3, 7, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Alphonse Foxhall', 'Data Science', 'Costco', 'Atlanta', 'Complete', 'Has Car', 1800, '1 year', 5, 'Eco-friendly', 25, 5, 'Is a member of the school robotics club and loves to build robots', 5, 9, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Shayne Dunleavy', 'Chemistry', 'Wells Fargo', 'Chicago', 'Searching for Housing', 'Searching for Carpool', 1100, '1 year', 5, 'Social', 45, 6, 'Enjoys painting and drawing in spare time', 6, 8, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Esta Schneider', 'English', 'Costco', 'London', 'Searching for Housing', 'Searching for Carpool', 2300, '6 months', 1, 'Minimalist', 10, 2, 'Is a talented artist and loves to create beautiful paintings', 6, 5, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Valene Tombleson', 'Computer Science', 'Colgate-Palmolive', 'D.C.', 'Searching for Roommates', 'Complete', 1100, '6 months', 2, 'Relaxed', 35, 4, 'Is a member of the school robotics club and loves to build robots', 5, 2, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Leicester Toop', 'Data Science', 'Ford', 'D.C.', 'Complete', 'Searching for Carpool', 1100, '6 months', 4, 'Eco-friendly', 20, 1, 'Wants to learn how to surf and ride the waves', 8, 5, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Jasmine Shere', 'Music', 'Procter & Gamble', 'New York City', 'Searching for Roommates', 'Complete', 1200, '1 year', 4, 'Active', 25, 6, 'Enjoys building and creating things with Legos', 3, 7, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Avrit Olley', 'Chemistry', 'IBM', 'Los Angeles', 'Complete', 'Complete', 1600, '6 months', 5, 'Minimalist', 20, 5, 'Wants to become a doctor and help people in need', 5, 8, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Iormina Oakeshott', 'Marketing', 'Merck & Co.', 'Atlanta', 'Searching for Housing', 'Has Car', 1800, '6 months', 3, 'Social', 30, 6, 'Wants to become a teacher and inspire young minds', 3, 9, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Steffi Lampbrecht', 'Music', 'Nestlé', 'Boston', 'Searching for Housing', 'Complete', 1700, '1 year', 1, 'Outgoing', 30, 1, 'Is a member of the school photography club and loves to take pictures', 5, 4, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Cazzie Pothecary', 'Biology', 'Intel', 'New York City', 'Searching for Roommates', 'Complete', 1000, '6 months', 1, 'Eco-friendly', 30, 2, 'Dreams of becoming a professional dancer and performing on stage', 2, 1, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Kerri MacKellar', 'Physics', 'Netflix', 'Chicago', 'Searching for Housing', 'Complete', 2400, '4 months', 3, 'Relaxed', 35, 5, 'Is passionate about fashion and loves to create their own outfits', 3, 8, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Laryssa Frye', 'History', 'IBM', 'London', 'Complete', 'Has Car', 1200, '4 months', 5, 'Minimalist', 35, 6, 'Wants to start a YouTube channel and create content for others to enjoy', 8, 9, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Dolli Hardaway', 'English', 'Roche', 'New York City', 'Searching for Housing', 'Complete', 1200, '1 year', 3, 'Cozy', 35, 4, 'Is passionate about helping animals and volunteers at a local shelter', 9, 2, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Constantin Milborn', 'Engineering', 'Boeing', 'D.C.', 'Complete', 'Has Car', 2100, '6 months', 3, 'Carefree', 20, 3, 'Enjoys learning about different cultures and traditions', 2, 7, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Krissie Rudeforth', 'Engineering', 'Walt Disney Company', 'Chicago', 'Searching for Housing', 'Has Car', 2400, '4 months', 3, 'Carefree', 10, 6, 'Loves to watch documentaries about space and the universe', 6, 2, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Pietrek Dmych', 'Chemistry', 'Coca-Cola', 'Los Angeles', 'Complete', 'Searching for Carpool', 2000, '6 months', 3, 'Balanced', 45, 5, 'Is a member of the school debate team and loves to argue their point', 3, 1, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Carin Deacon', 'Art', 'Warner Bros. Discovery', 'D.C.', 'Searching for Housing', 'Has Car', 2400, '4 months', 2, 'Minimalist', 15, 6, 'Dreams of becoming a professional athlete and competing in the Olympics', 3, 7, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Marci Skate', 'Marketing', 'Target', 'New York City', 'Searching for Housing', 'Searching for Carpool', 1300, '1 year', 5, 'Carefree', 15, 6, 'Is passionate about music and plays the guitar in a band', 9, 6, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Sidonnie Downage', 'Physics', 'Colgate-Palmolive', 'Chicago', 'Complete', 'Searching for Carpool', 1900, '6 months', 5, 'Sustainable', 30, 4, 'Is a talented dancer and performs in recitals', 9, 7, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Hyacinth Pinnere', 'Music', 'Apple', 'Atlanta', 'Searching for Roommates', 'Has Car', 1000, '1 year', 2, 'Healthy', 30, 5, 'Wants to become a teacher and inspire young minds', 5, 1, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Dirk Mc Giffin', 'Physics', 'Moderna', 'D.C.', 'Searching for Roommates', 'Has Car', 2400, '4 months', 4, 'Eco-friendly', 35, 5, 'Enjoys playing video games and competing in online tournaments', 4, 5, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('June Wenderoth', 'Chemistry', 'Hyundai', 'Atlanta', 'Complete', 'Has Car', 1000, '1 year', 1, 'Social', 15, 5, 'Wants to become a doctor and help people in need', 4, 9, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Gratia Rawles', 'Business', 'Nestlé', 'Chicago', 'Complete', 'Has Car', 1900, '4 months', 4, 'Holistic', 45, 5, 'Dreams of becoming a professional athlete and playing in the Olympics', 8, 4, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Melisa Ingman', 'Business', 'Google (Alphabet Inc.)', 'San Francisco', 'Searching for Roommates', 'Complete', 2200, '4 months', 4, 'Social', 35, 4, 'Is passionate about equality and volunteers for social justice causes', 5, 8, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Krystalle Howe', 'Physics', 'General Motors', 'Atlanta', 'Searching for Housing', 'Searching for Carpool', 1100, '6 months', 1, 'Carefree', 10, 4, 'Wants to learn how to skateboard and do tricks at the skate park', 9, 9, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Leone Blagburn', 'Engineering', 'Netflix', 'San Jose', 'Complete', 'Has Car', 1600, '6 months', 5, 'Eco-friendly', 35, 3, 'Dreams of becoming a famous chef and opening their own restaurant', 2, 5, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Leonie Stoner', 'Business', 'Walmart', 'Seattle', 'Complete', 'Has Car', 1500, '1 year', 3, 'Eco-friendly', 45, 2, 'Enjoys learning about different cultures and traditions', 4, 1, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Briney Sickamore', 'Data Science', 'Amazon', 'Chicago', 'Searching for Housing', 'Has Car', 1400, '6 months', 3, 'Cozy', 10, 3, 'Is passionate about music and plays the guitar in a band', 5, 8, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Manda Try', 'Computer Science', 'Apple', 'Los Angeles', 'Searching for Roommates', 'Searching for Carpool', 1500, '4 months', 5, 'Social', 45, 6, 'Loves to watch cooking shows and try out new recipes at home', 1, 9, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Ricoriki Irvin', 'Data Science', 'Roche', 'D.C.', 'Complete', 'Has Car', 1300, '4 months', 2, 'Active', 30, 1, 'Is passionate about equality and volunteers for social justice causes', 7, 3, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Luciano Kerr', 'Chemistry', 'Hyundai', 'San Jose', 'Searching for Roommates', 'Has Car', 1300, '4 months', 4, 'Vibrant', 30, 5, 'Is a member of the school newspaper and loves to write articles', 9, 7, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Marcie Stilly', 'Business', 'Unilever', 'D.C.', 'Searching for Housing', 'Has Car', 2000, '1 year', 1, 'Minimalist', 45, 5, 'Wants to learn how to surf and ride the waves', 7, 5, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Ryun Swayland', 'Physics', 'Home Depot', 'Seattle', 'Searching for Housing', 'Has Car', 1000, '1 year', 4, 'Minimalist', 30, 2, 'Wants to learn how to surf and ride the waves', 1, 5, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Sonni Muriel', 'Data Science', 'Meta (Facebook)', 'London', 'Searching for Roommates', 'Searching for Carpool', 1400, '6 months', 5, 'Relaxed', 20, 1, 'Is a member of the school photography club and loves to take pictures', 6, 6, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Lindy Marchand', 'Chemistry', 'Apple', 'San Jose', 'Searching for Roommates', 'Has Car', 1200, '4 months', 5, 'Balanced', 25, 4, 'Loves to watch cooking shows and try out new recipes at home', 10, 7, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Joellen Rao', 'History', 'Boeing', 'Chicago', 'Searching for Housing', 'Has Car', 1000, '6 months', 5, 'Active', 10, 1, 'Wants to learn how to surf and ride the waves', 9, 2, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Duke Carmont', 'Art', 'Johnson & Johnson', 'Los Angeles', 'Complete', 'Has Car', 1000, '1 year', 4, 'Eco-friendly', 20, 6, 'Is a member of the school band and plays the trumpet', 9, 8, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Adolph Kyngdon', 'History', 'Hyundai', 'Boston', 'Searching for Roommates', 'Searching for Carpool', 2400, '4 months', 3, 'Active', 10, 3, 'Is a talented artist and loves to create beautiful paintings', 8, 8, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Aurilia McComb', 'Public Health', 'Wells Fargo', 'Boston', 'Complete', 'Complete', 2300, '1 year', 4, 'Sustainable', 30, 6, 'Enjoys playing board games with friends and family', 8, 3, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Willow Girardet', 'Art', 'JPMorgan Chase', 'D.C.', 'Complete', 'Has Car', 1700, '1 year', 1, 'Relaxed', 20, 3, 'Loves to read adventure stories', 10, 9, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Suzy Taysbil', 'Art', 'Warner Bros. Discovery', 'Los Angeles', 'Complete', 'Complete', 1600, '1 year', 3, 'Healthy', 10, 3, 'Dreams of starting a small business and being their own boss', 2, 4, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Michaella Friedlos', 'Computer Science', 'Best Buy', 'London', 'Searching for Roommates', 'Has Car', 1800, '1 year', 2, 'Active', 35, 5, 'Enjoys volunteering at the local food bank and helping those in need', 9, 7, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Corbett Alldre', 'Art', 'Unilever', 'San Jose', 'Complete', 'Searching for Carpool', 2200, '6 months', 4, 'Minimalist', 20, 5, 'Loves to read fantasy books and escape into magical worlds', 5, 9, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Ruthy Grumble', 'Physics', 'AstraZeneca', 'New York City', 'Searching for Housing', 'Complete', 1700, '4 months', 2, 'Vibrant', 20, 6, 'Enjoys photography and capturing beautiful moments', 2, 4, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Thaddus Strowlger', 'Art', 'Citigroup', 'Los Angeles', 'Searching for Roommates', 'Searching for Carpool', 1100, '1 year', 3, 'Active', 20, 4, 'Dreams of becoming a professional athlete and playing in the Olympics', 6, 6, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Peadar Toffts', 'Art', 'Honda', 'D.C.', 'Complete', 'Has Car', 1300, '4 months', 4, 'Healthy', 35, 4, 'Loves to watch documentaries about space and the universe', 6, 5, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Emmeline Maly', 'History', 'IBM', 'New York City', 'Complete', 'Searching for Carpool', 1800, '4 months', 2, 'Minimalist', 35, 3, 'Loves to read mystery novels and solve puzzles', 9, 4, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Hagan Dobbison', 'Chemistry', 'Wells Fargo', 'San Jose', 'Searching for Roommates', 'Searching for Carpool', 1000, '1 year', 3, 'Active', 15, 1, 'Wants to become a teacher and inspire young minds', 1, 4, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Rhetta McGrale', 'Computer Science', 'BP', 'D.C.', 'Complete', 'Complete', 2300, '6 months', 3, 'Relaxed', 25, 5, 'Is a member of the school band and plays the trumpet', 8, 9, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Margaux Westlake', 'Engineering', 'BMW', 'New York City', 'Searching for Roommates', 'Searching for Carpool', 1100, '6 months', 3, 'Holistic', 30, 3, 'Is a member of the school debate team and loves to argue their point', 4, 8, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Nanine Giorgi', 'Music', 'Tesla', 'Atlanta', 'Searching for Roommates', 'Complete', 1100, '1 year', 2, 'Carefree', 10, 3, 'Dreams of starting a small business and being their own boss', 8, 5, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Archie Lennox', 'Computer Science', 'Google (Alphabet Inc.)', 'San Francisco', 'Complete', 'Complete', 1600, '1 year', 5, 'Carefree', 30, 2, 'Enjoys playing chess and strategizing their next move', 7, 3, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Charlton Waine', 'Biology', 'Shell', 'San Francisco', 'Searching for Roommates', 'Has Car', 2000, '4 months', 5, 'Cozy', 15, 6, 'Wants to learn how to code and create their own video games', 4, 8, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Jarad Lichfield', 'Business', 'Colgate-Palmolive', 'London', 'Searching for Housing', 'Searching for Carpool', 2300, '1 year', 5, 'Eco-friendly', 25, 4, 'Enjoys volunteering at the local food bank and helping those in need', 9, 1, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Clemens Boustead', 'Music', 'BMW', 'San Francisco', 'Searching for Roommates', 'Searching for Carpool', 1900, '6 months', 3, 'Carefree', 15, 1, 'Wants to become a doctor and help people in need', 8, 1, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Wakefield Hearmon', 'Chemistry', 'Mercedes-Benz', 'D.C.', 'Searching for Housing', 'Complete', 1900, '1 year', 1, 'Outgoing', 25, 4, 'Has a pet dog named Max', 9, 3, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Judye Laurencot', 'Business', 'Hyundai', 'Seattle', 'Searching for Housing', 'Searching for Carpool', 1900, '1 year', 3, 'Holistic', 15, 2, 'Is a member of the school choir and loves to sing', 2, 7, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Toiboid McPhate', 'Finance', 'Siemens Energy', 'London', 'Searching for Housing', 'Has Car', 1200, '1 year', 5, 'Healthy', 45, 4, 'Is a member of the school coding club and loves to program', 9, 8, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Egan Deedes', 'Marketing', 'Shell', 'San Francisco', 'Searching for Roommates', 'Searching for Carpool', 2300, '4 months', 1, 'Active', 35, 3, 'Is a talented artist and loves to create beautiful paintings', 3, 9, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Caddric Skin', 'Art', 'Shell', 'D.C.', 'Searching for Housing', 'Searching for Carpool', 2200, '6 months', 2, 'Cozy', 20, 1, 'Is passionate about environmental conservation and volunteers for clean-up projects', 7, 3, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, AdvisorID, Reminder) values ('Kalina Whitham', 'Public Health', 'General Motors', 'Atlanta', 'Searching for Housing', 'Complete', 1700, '4 months', 4, 'Healthy', 20, 1, 'Loves to read mystery novels and solve puzzles', 1, 9, 3);

-- 6. Events Data (depends on CityCommunity)
insert into Events (CommunityID, Date, Name, Description) values (1, '2024-01-01', 'New Year Celebration', 'Community gathering');
insert into Events (CommunityID, Date, Name, Description) values (2, '2024-06-01', 'Networking Mixer Mondays', 'Interactive workshops on networking skills');
insert into Events (CommunityID, Date, Name, Description) values (3, '2024-09-25', 'Career Development Workshop', 'Panel discussion on career opportunities in tech');
insert into Events (CommunityID, Date, Name, Description) values (4, '2024-05-21', 'Industry Panel Discussions', 'Speed networking session with recruiters');
insert into Events (CommunityID, Date, Name, Description) values (5, '2024-02-24', 'Resume Building Bootcamp', 'Virtual networking happy hour');
insert into Events (CommunityID, Date, Name, Description) values (6, '2024-02-25', 'LinkedIn Profile Optimization', 'Mock interview practice with HR professionals');
insert into Events (CommunityID, Date, Name, Description) values (7, '2024-06-07', 'Mock Interview Practice', 'Resume review session with career coaches');
insert into Events (CommunityID, Date, Name, Description) values (8, '2024-01-11', 'Job Search Strategies', 'Networking bingo game with prizes');
insert into Events (CommunityID, Date, Name, Description) values (9, '2024-08-12', 'Personal Branding Workshop', 'LinkedIn profile optimization workshop');
insert into Events (CommunityID, Date, Name, Description) values (10, '2024-02-19', 'Internship Opportunities Panel', 'Networking scavenger hunt');
insert into Events (CommunityID, Date, Name, Description) values (1, '2023-12-24', 'Alumni Networking Happy Hour', 'Group networking activities and icebreakers');
insert into Events (CommunityID, Date, Name, Description) values (2, '2024-05-26', 'Diversity in Tech Panel', 'Networking lunch with keynote speaker');
insert into Events (CommunityID, Date, Name, Description) values (3, '2024-10-24', 'Entrepreneurship Panel Series', 'Networking mixer with live music');
insert into Events (CommunityID, Date, Name, Description) values (4, '2024-04-15', 'Women in STEM Networking Event', 'Networking roundtable discussions');
insert into Events (CommunityID, Date, Name, Description) values (5, '2024-02-17', 'Professional Headshot Day', 'Professional headshot photo booth');
insert into Events (CommunityID, Date, Name, Description) values (6, '2024-07-03', 'Coding Challenge Competition', 'Networking coffee chat with mentors');
insert into Events (CommunityID, Date, Name, Description) values (7, '2024-07-02', 'Start-Up Pitch Night', 'Networking book club discussion');
insert into Events (CommunityID, Date, Name, Description) values (8, '2024-07-30', 'Career Fair Prep Workshop', 'Networking yoga session');
insert into Events (CommunityID, Date, Name, Description) values (9, '2024-04-10', 'Graduate School Info Session', 'Networking cooking class');
insert into Events (CommunityID, Date, Name, Description) values (10, '2024-01-09', 'Industry Trends Roundtable', 'Networking hike and picnic');
insert into Events (CommunityID, Date, Name, Description) values (1, '2024-09-27', 'Tech Talk Thursdays', 'Meet and greet with industry professionals');
insert into Events (CommunityID, Date, Name, Description) values (2, '2024-04-27', 'Networking Mixer Mondays', 'Interactive workshops on networking skills');
insert into Events (CommunityID, Date, Name, Description) values (3, '2024-07-12', 'Career Development Workshop', 'Panel discussion on career opportunities in tech');
insert into Events (CommunityID, Date, Name, Description) values (4, '2024-09-01', 'Industry Panel Discussions', 'Speed networking session with recruiters');
insert into Events (CommunityID, Date, Name, Description) values (5, '2024-09-23', 'Resume Building Bootcamp', 'Virtual networking happy hour');
insert into Events (CommunityID, Date, Name, Description) values (6, '2024-09-21', 'LinkedIn Profile Optimization', 'Mock interview practice with HR professionals');
insert into Events (CommunityID, Date, Name, Description) values (7, '2024-01-24', 'Mock Interview Practice', 'Resume review session with career coaches');
insert into Events (CommunityID, Date, Name, Description) values (8, '2024-01-17', 'Job Search Strategies', 'Networking bingo game with prizes');
insert into Events (CommunityID, Date, Name, Description) values (9, '2024-01-12', 'Personal Branding Workshop', 'LinkedIn profile optimization workshop');
insert into Events (CommunityID, Date, Name, Description) values (10, '2024-10-24', 'Internship Opportunities Panel', 'Networking scavenger hunt');
insert into Events (CommunityID, Date, Name, Description) values (1, '2024-08-10', 'Alumni Networking Happy Hour', 'Group networking activities and icebreakers');
insert into Events (CommunityID, Date, Name, Description) values (2, '2024-07-14', 'Diversity in Tech Panel', 'Networking lunch with keynote speaker');
insert into Events (CommunityID, Date, Name, Description) values (3, '2023-12-13', 'Entrepreneurship Panel Series', 'Networking mixer with live music');
insert into Events (CommunityID, Date, Name, Description) values (4, '2024-10-08', 'Women in STEM Networking Event', 'Networking roundtable discussions');
insert into Events (CommunityID, Date, Name, Description) values (5, '2024-01-13', 'Professional Headshot Day', 'Professional headshot photo booth');
insert into Events (CommunityID, Date, Name, Description) values (6, '2024-01-09', 'Coding Challenge Competition', 'Networking coffee chat with mentors');
insert into Events (CommunityID, Date, Name, Description) values (7, '2024-03-12', 'Start-Up Pitch Night', 'Networking book club discussion');
insert into Events (CommunityID, Date, Name, Description) values (8, '2024-10-12', 'Career Fair Prep Workshop', 'Networking yoga session');
insert into Events (CommunityID, Date, Name, Description) values (9, '2024-02-08', 'Graduate School Info Session', 'Networking cooking class');
insert into Events (CommunityID, Date, Name, Description) values (10, '2024-09-26', 'Industry Trends Roundtable', 'Networking hike and picnic');
insert into Events (CommunityID, Date, Name, Description) values (1, '2024-01-14', 'Tech Talk Thursdays', 'Meet and greet with industry professionals');
insert into Events (CommunityID, Date, Name, Description) values (2, '2024-08-12', 'Networking Mixer Mondays', 'Interactive workshops on networking skills');
insert into Events (CommunityID, Date, Name, Description) values (3, '2024-09-18', 'Career Development Workshop', 'Panel discussion on career opportunities in tech');
insert into Events (CommunityID, Date, Name, Description) values (4, '2024-08-13', 'Industry Panel Discussions', 'Speed networking session with recruiters');
insert into Events (CommunityID, Date, Name, Description) values (5, '2024-08-07', 'Resume Building Bootcamp', 'Virtual networking happy hour');
insert into Events (CommunityID, Date, Name, Description) values (6, '2024-09-06', 'LinkedIn Profile Optimization', 'Mock interview practice with HR professionals');
insert into Events (CommunityID, Date, Name, Description) values (7, '2024-10-05', 'Mock Interview Practice', 'Resume review session with career coaches');
insert into Events (CommunityID, Date, Name, Description) values (8, '2024-10-06', 'Job Search Strategies', 'Networking bingo game with prizes');
insert into Events (CommunityID, Date, Name, Description) values (9, '2024-11-24', 'Personal Branding Workshop', 'LinkedIn profile optimization workshop');
insert into Events (CommunityID, Date, Name, Description) values (10, '2024-11-08', 'Internship Opportunities Panel', 'Networking scavenger hunt');

-- 7. Feedback Data (depends on Student and Advisor)
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Great progress this semester', '2024-01-15', 5, 1, 1);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Thank you for this recommendation!', '2024-05-02', 2, 83, 7);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Thank you for your help', '2024-08-20', 4, 35, 1);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Still searching for roommates', '2024-01-02', 3, 80, 9);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Still searching for roommates', '2024-06-20', 4, 6, 5);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Thank you for your help', '2024-07-16', 5, 23, 2);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Housing is in a good area', '2024-01-31', 4, 2, 8);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Still looking for housing', '2024-05-10', 2, 73, 6);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Thank you for this recommendation!', '2024-05-23', 5, 90, 4);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('still searching for carpool', '2024-04-27', 3, 93, 10);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Still searching for roommates', '2024-04-02', 4, 60, 3);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Enjoying my co-op experience', '2024-08-07', 5, 17, 7);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Enjoying my co-op experience', '2024-08-05', 4, 81, 1);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('still searching for carpool', '2024-11-14', 2, 15, 9);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Still looking for housing', '2024-07-17', 2, 98, 5);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Still looking for housing', '2024-08-22', 3, 39, 2);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('I appreciate your assistance!', '2024-01-09',4, 95, 8);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Housing is in a good area', '2024-11-09', 5, 30, 6);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Still searching for roommates', '2024-06-19', 1, 84, 4);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Still looking for housing', '2023-12-09', 2, 15, 10);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('I appreciate your assistance!', '2024-01-27', 3, 15, 3);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Thank you for this recommendation!', '2024-01-12', 3, 5, 7);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('still searching for carpool', '2024-10-15', 4, 9, 1);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('still searching for carpool', '2024-09-16', 5, 56, 9);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Housing is in a good area', '2024-09-17', 1, 70, 5);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('I appreciate your assistance!', '2024-11-02', 2, 45, 2);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Currently enjoying this co-op', '2024-02-26', 3, 60, 8);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Still searching for roommates', '2024-07-30', 3, 68, 6);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Currently enjoying this co-op', '2024-09-27', 4, 24, 4);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Still searching for roommates', '2024-11-09', 5, 36, 10);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('I appreciate your assistance!', '2024-07-14', 1, 33, 3);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('still searching for carpool', '2024-05-04', 2, 45, 7);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Enjoying my co-op experience', '2024-11-22', 4, 62, 1);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Housing is in a good area', '2024-01-12', 3, 81, 9);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('I appreciate your assistance!', '2024-09-07', 4, 3, 5);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Enjoying my co-op experience', '2024-10-06', 5, 52, 2);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Currently enjoying this co-op', '2024-06-01', 5, 20, 8);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('still searching for carpool', '2024-07-11', 2, 93, 6);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Thank you for this recommendation!', '2024-05-04', 5, 43, 4);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Still searching for roommates', '2024-04-16', 3, 70, 10);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('still searching for carpool', '2024-06-28', 4, 7, 3);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('I appreciate your assistance!', '2024-06-14', 5, 87, 7);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Enjoying my co-op experience', '2024-10-14', 1, 73, 1);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Currently enjoying this co-op', '2024-05-31', 2, 35, 9);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Still looking for housing', '2024-03-29', 4, 3, 5);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Thank you for your help', '2024-01-07', 3, 2, 2);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Currently enjoying this co-op', '2023-12-28', 4, 86, 8);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Thank you for your help', '2024-11-16', 5, 54, 6);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('Currently enjoying this co-op', '2024-05-19', 5, 32, 4);
insert into Feedback (Description, Date, ProgressRating, StudentID, AdvisorID) values ('I appreciate your assistance!', '2024-03-05', 2, 95, 10);

-- 8. Task Data (depends on Student and Advisor)
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Complete housing application', '2024-02-01', 1, '2024-02-15', 'Pending', 1);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Khoury College', '2024-02-27', 22, '2024-08-03', 'In Progress', 6);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Engineering', '2024-05-09', 89, '2024-03-09', 'In Progress', 10);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('D''Amore Mc-Kim', '2024-07-08', 37, '2024-05-01', 'Completed', 8);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Science', '2024-11-26', 55, '2024-02-20', 'Completed', 1);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Bouve College', '2024-06-02', 50, '2024-04-09', 'Received', 9);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Science', '2024-05-03', 50, '2024-11-24', 'Completed', 4);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Khoury College', '2024-09-07', 69, '2024-08-22', 'Completed', 6);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Engineering', '2024-03-25', 84, '2024-06-23', 'In Progress', 6);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('D''Amore Mc-Kim', '2024-05-26', 86, '2024-08-25', 'Received', 10);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Science', '2023-12-04', 65, '2024-11-30', 'Completed', 10);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Bouve College', '2024-03-26', 26, '2024-04-04', 'Received', 2);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Science', '2024-05-14', 12, '2024-10-24', 'In Progress', 1);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Khoury College', '2024-03-05', 73, '2024-01-06', 'Completed', 7);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Engineering', '2024-04-18', 82, '2024-08-28', 'Received', 2);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('D''Amore Mc-Kim', '2024-11-27', 53, '2024-08-26', 'Received', 1);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Science', '2024-09-25', 96, '2024-11-30', 'Received', 1);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Bouve College', '2024-07-05', 81, '2024-01-27', 'In Progress', 7);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Science', '2024-09-16', 50, '2023-12-15', 'In Progress', 5);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Khoury College', '2024-10-18', 80, '2024-04-15', 'Received', 6);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Engineering', '2024-09-21', 69, '2024-04-27', 'Completed', 3);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('D''Amore Mc-Kim', '2024-02-21', 26, '2024-07-21', 'Completed', 6);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Science', '2024-10-24', 69, '2024-09-30', 'Received', 4);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Bouve College', '2024-07-20', 15, '2024-02-28', 'Received', 6);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Science', '2024-11-03', 44, '2024-04-28', 'Completed', 5);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Khoury College', '2024-03-04', 32, '2024-02-14', 'Received', 1);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Engineering', '2024-03-02', 44, '2024-06-16', 'In Progress', 6);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('D''Amore Mc-Kim', '2024-04-01', 2, '2024-02-22', 'Received', 6);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Science', '2024-06-06', 14, '2023-12-14', 'In Progress', 7);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Bouve College', '2023-12-19', 24, '2024-04-14', 'Received', 5);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Science', '2024-01-28', 40, '2023-12-20', 'Completed', 2);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Khoury College', '2024-07-16', 51, '2024-02-29', 'Received', 9);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Engineering', '2024-10-16', 34, '2024-07-31', 'In Progress', 9);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('D''Amore Mc-Kim', '2024-05-27', 89, '2024-10-10', 'Received', 8);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Science', '2024-09-26', 13, '2024-09-23', 'Received', 5);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Bouve College', '2023-12-21', 47, '2024-11-20', 'Completed', 5);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Science', '2024-06-05', 40, '2024-02-04', 'In Progress', 10);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Khoury College', '2024-10-07', 35, '2024-03-11', 'Completed', 1);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Engineering', '2024-04-08', 23, '2024-03-18', 'Completed', 1);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('D''Amore Mc-Kim', '2024-03-26', 36, '2024-05-10', 'Completed', 4);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Science', '2024-07-14', 68, '2024-10-09', 'In Progress', 5);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Bouve College', '2024-09-03', 94, '2024-06-20', 'In Progress', 7);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Science', '2024-04-11', 23, '2024-02-11', 'In Progress', 9);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Khoury College', '2023-12-10', 86, '2024-05-04', 'Received', 8);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Engineering', '2024-11-08', 77, '2024-10-07', 'Completed', 4);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('D''Amore Mc-Kim', '2023-12-07', 11, '2024-02-15', 'In Progress', 1);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Science', '2024-04-07', 73, '2024-04-16', 'In Progress', 3);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Bouve College', '2024-08-28', 3, '2024-04-05', 'Received', 3);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Science', '2024-07-28', 16, '2024-01-17', 'Completed', 3);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('Khoury College', '2024-02-21', 73, '2024-11-12', 'Completed', 1);
insert into Task (Description, Reminder, AssignedTo, DueDate, Status, AdvisorID) values ('College of Engineering', '2024-08-21', 40, '2024-09-04', 'Completed', 6);

-- 9. Ticket Data (depends on User)
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (1, 'Technical Issue', 'Open', 'High', '2024-01-01', NULL);
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (2, 'payment processing error', 'completed', 'Medium', '2024-10-02', '2024-05-15');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (3, 'video playback issue', 'cancelled', 'Low', '2024-05-21', '2024-06-08');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (4, 'page not loading', 'cancelled', 'High', '2024-05-30', '2024-03-22');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (5, 'broken link', 'cancelled', 'High', '2023-12-26', '2024-11-23');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (6, 'payment processing error', 'pending', 'High', '2024-02-12', '2024-01-19');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (7, 'missing images', 'pending', 'Low', '2024-07-18', '2024-06-13');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (8, 'incorrect password', 'pending', 'Medium', '2024-07-29', '2024-01-02');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (9, 'login error', 'completed', 'Medium', '2024-02-22', '2024-09-28');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (10, 'page not loading', 'pending', 'High', '2024-07-24', '2024-05-24');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (11, 'search function not working', 'pending', 'High', '2024-01-25', '2024-07-07');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (12, 'payment processing error', 'cancelled', 'Low', '2024-05-25', '2024-05-22');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (13, 'formatting problem', 'pending', 'Low', '2024-01-12', '2024-09-08');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (14, 'missing images', 'cancelled', 'Low', '2024-01-12', '2024-01-18');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (15, 'search function not working', 'cancelled', 'Medium', '2024-01-03', '2024-05-23');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (16, 'slow performance', 'completed', 'Low', '2024-02-16', '2024-09-30');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (17, 'slow performance', 'pending', 'High', '2024-03-27', '2024-07-02');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (18, 'payment processing error', 'pending', 'Medium', '2024-08-14', '2024-10-16');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (19, 'payment processing error', 'pending', 'Medium', '2024-08-20', '2024-10-06');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (20, 'missing images', 'pending', 'High', '2024-08-12', '2024-11-14');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (21, 'broken link', 'pending', 'Medium', '2024-01-15', '2024-04-20');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (22, 'payment processing error', 'pending', 'Low', '2023-12-09', '2024-01-23');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (23, 'search function not working', 'completed', 'Medium', '2024-02-05', '2024-02-18');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (24, 'formatting problem', 'completed', 'Low', '2024-04-06', '2024-08-09');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (25, 'video playback issue', 'pending', 'High', '2024-08-22', '2024-08-19');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (26, 'search function not working', 'pending', 'Medium', '2024-07-19', '2024-09-25');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (27, 'broken link', 'cancelled', 'High', '2024-05-20', '2024-01-22');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (28, 'broken link', 'cancelled', 'High', '2024-07-23', '2023-12-03');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (29, 'broken link', 'pending', 'Low', '2024-10-16', '2024-07-15');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (30, 'login error', 'completed', 'Low', '2024-07-08', '2024-03-14');


-- 10. SystemLog Data (depends on Ticket)
INSERT INTO SystemLog (LogID, TicketID, Timestamp, Activity, MetricType, Privacy, Security)
VALUES 
(1, 10, '2024-02-01 10:30:00', 'User logged in', 'High', 'Privacy Requests', 'Encryption'),
(2, 15, '2024-03-05 14:15:00', 'User updated profile', 'Medium', 'User Consent', 'Data Integrity'),
(3, 8, '2024-04-10 18:45:00', 'User logged out', 'Low', 'Anonymity', 'Authentication'),
(4, 20, '2024-05-01 09:00:00', 'User deleted profile', 'High', 'Privacy Requests', 'Access Control'),
(5, 12, '2024-06-20 12:00:00', 'User logged in', 'Medium', 'Data Sharing', 'Audit Logs'),
(6, 18, '2024-07-15 16:30:00', 'User updated profile', 'High', 'Security Events', 'Password Security'),
(7, 22, '2024-08-08 13:00:00', 'User logged out', 'Low', 'Privacy Requests', 'Encryption'),
(8, 25, '2024-09-12 17:45:00', 'User added event', 'High', 'Privacy Settings', 'User Reports'),
(9, 11, '2024-10-05 15:00:00', 'User logged in', 'Medium', 'Security Events', 'Intrusion Detection'),
(10, 6, '2024-11-15 11:30:00', 'User deleted profile', 'High', 'Anonymity', 'Access Control'),
(11, 19, '2024-12-02 08:45:00', 'User updated profile', 'Low', 'Data Access', 'Audit Logs'),
(12, 7, '2025-01-10 14:15:00', 'User logged in', 'Medium', 'User Consent', 'Authentication'),
(13, 14, '2025-02-05 16:00:00', 'User logged out', 'High', 'Privacy Requests', 'Encryption'),
(14, 23, '2025-03-12 10:30:00', 'User added event', 'Low', 'Anonymity', 'User Reports'),
(15, 5, '2025-04-15 12:45:00', 'User deleted profile', 'High', 'Data Sharing', 'Data Integrity'),
(16, 3, '2025-05-20 15:30:00', 'User logged out', 'Medium', 'Security Events', 'Password Security'),
(17, 16, '2025-06-25 09:15:00', 'User updated profile', 'High', 'Privacy Requests', 'Audit Logs'),
(18, 2, '2025-07-01 18:00:00', 'User added event', 'Medium', 'User Consent', 'Encryption'),
(19, 9, '2025-08-05 11:00:00', 'User logged in', 'Low', 'Privacy Requests', 'Intrusion Detection'),
(20, 4, '2025-09-15 14:00:00', 'User deleted profile', 'High', 'Security Events', 'Access Control');




INSERT INTO SystemHealth (LogID, Timestamp, Status, MetricType)
VALUES 
(1, '2024-02-01 12:00:00', 'Normal', 'System Performance'),
(2, '2024-03-05 14:30:00', 'Operational', 'User Login Attempts'),
(3, '2024-04-10 19:00:00', 'Recovered', 'Network Latency'),
(4, '2024-05-01 09:30:00', 'Active', 'Data Throughput'),
(5, '2024-06-20 12:30:00', 'Complete', 'Disk Space'),
(6, '2024-07-15 17:00:00', 'Normal', 'CPU Usage'),
(7, '2024-08-08 13:30:00', 'Operational', 'System Uptime'),
(8, '2024-09-12 18:00:00', 'Recovered', 'Service Downtime'),
(9, '2024-10-05 15:30:00', 'Complete', 'Backup Success Rate'),
(10, '2024-11-15 12:00:00', 'Active', 'Response Time'),
(11, '2024-12-02 09:00:00', 'Normal', 'System Scalability'),
(12, '2025-01-10 14:30:00', 'Operational', 'Error Rate'),
(13, '2025-02-05 16:30:00', 'Recovered', 'Database Backup Frequency'),
(14, '2025-03-12 11:00:00', 'Complete', 'Patch Management'),
(15, '2025-04-15 13:00:00', 'Active', 'System Load'),
(16, '2025-05-20 16:00:00', 'Operational', 'Active Connections'),
(17, '2025-06-25 09:30:00', 'Normal', 'Security Events'),
(18, '2025-07-01 18:30:00', 'Recovered', 'Incident Resolution Time'),
(19, '2025-08-05 11:30:00', 'Complete', 'Database Query Time'),
(20, '2025-09-15 14:30:00', 'Active', 'System Load');

