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
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Dormitory', 'San Francisco', 1);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Apartment', 'San Jose', 2);
insert into Housing (Availability, Style, Location, CommunityID) values ('Pending approval', 'Fraternity/Sorority House', 'Los Angeles', 3);
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Off-Campus House', 'London', 4);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Townhouse', 'Boston', 5);
insert into Housing (Availability, Style, Location, CommunityID) values ('Pending approval', 'Co-op Housing', 'New York City', 6);
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Tiny House', 'Chicago', 7);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Loft', 'Seattle', 8);
insert into Housing (Availability, Style, Location, CommunityID) values ('Pending approval', 'Studio Apartment', 'D.C.', 9);
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Shared Room', 'San Francisco', 10);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Dormitory', 'San Jose', 11);
insert into Housing (Availability, Style, Location, CommunityID) values ('Pending approval', 'Apartment', 'Los Angeles', 12);
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Fraternity/Sorority House', 'London', 13);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Off-Campus House', 'Boston', 14);
insert into Housing (Availability, Style, Location, CommunityID) values ('Pending approval', 'Townhouse', 'New York City', 15);
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Co-op Housing', 'Chicago', 16);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Tiny House', 'Seattle', 17);
insert into Housing (Availability, Style, Location, CommunityID) values ('Pending approval', 'Loft', 'D.C.', 18);
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Studio Apartment', 'San Francisco', 19);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Shared Room', 'San Jose', 20);
insert into Housing (Availability, Style, Location, CommunityID) values ('Pending approval', 'Dormitory', 'Los Angeles', 21);
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Apartment', 'London', 22);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Fraternity/Sorority House', 'Boston', 23);
insert into Housing (Availability, Style, Location, CommunityID) values ('Pending approval', 'Off-Campus House', 'New York City', 24);
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Townhouse', 'Chicago', 25);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Co-op Housing', 'Seattle', 26);
insert into Housing (Availability, Style, Location, CommunityID) values ('Pending approval', 'Tiny House', 'D.C.', 27);
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Loft', 'San Francisco', 28);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Studio Apartment', 'San Jose', 29);
insert into Housing (Availability, Style, Location, CommunityID) values ('Pending approval', 'Shared Room', 'Los Angeles', 30);
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Dormitory', 'London', 31);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Apartment', 'Boston', 32);
insert into Housing (Availability, Style, Location, CommunityID) values ('Pending approval', 'Fraternity/Sorority House', 'New York City', 33);
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Off-Campus House', 'Chicago', 34);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Townhouse', 'Seattle', 35);
insert into Housing (Availability, Style, Location, CommunityID) values ('Pending approval', 'Co-op Housing', 'D.C.', 36);
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Tiny House', 'San Francisco', 37);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Loft', 'San Jose', 38);
insert into Housing (Availability, Style, Location, CommunityID) values ('Pending approval', 'Studio Apartment', 'Los Angeles', 39);
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Shared Room', 'London', 40);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Dormitory', 'Boston', 41);
insert into Housing (Availability, Style, Location, CommunityID) values ('Pending approval', 'Apartment', 'New York City', 42);
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Fraternity/Sorority House', 'Chicago', 43);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Off-Campus House', 'Seattle', 44);
insert into Housing (Availability, Style, Location, CommunityID) values ('Pending approval', 'Townhouse', 'D.C.', 45);
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Co-op Housing', 'San Francisco', 46);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Tiny House', 'San Jose', 47);
insert into Housing (Availability, Style, Location, CommunityID) values ('Pending approval', 'Loft', 'Los Angeles', 48);
insert into Housing (Availability, Style, Location, CommunityID) values ('Vacant', 'Studio Apartment', 'London', 49);
insert into Housing (Availability, Style, Location, CommunityID) values ('Occupied', 'Shared Room', 'Boston', 50);

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
insert into User (Name, Email, Role, PermissionsLevel) values ('Thaddus Pettiford', 'bpettiford@cargocollective.com', 'Business', 'hasCar', 2500, '4 months', 'Disorganized', 'Active', 55, 7, 'Comic book store owner selling rare and collectible comics', 1, null, 10);
insert into User (Name, Email, Role, PermissionsLevel) values ('Aprilette Kidd', 'akidd@cargocollective.com', 'Computer Science', 'notInterested', 2000, '6 months', 'Disorganized', 'Extroverted', 75, 6, 'Chess master competing in international tournaments and championships', 2, null, 8);
insert into User (Name, Email, Role, PermissionsLevel) values ('Simone Fishbourne', 'sfishbourne@cargocollective.com', 'Art', 'complete', 1600, '6 months', 'Disorganized', 'Adventurous', 30, 7, 'Music aficionado attending concerts and music festivals', 5, null, 5);
insert into User (Name, Email, Role, PermissionsLevel) values ('Jonis MacAlaster', 'jmacalaster@cargocollective.com', 'Finance', 'hasCar', 170, '6 months', 'Messy', 'Quiet', 40, 3, 'Yoga studio owner providing classes in relaxation and mindfulness', 2, null, 8);
insert into User (Name, Email, Role, PermissionsLevel) values ('Collette Lazenby', 'clazenby@cargocollective.com', 'Finance', 'hasCar', 3000, '4 months', 'Cluttered', 'Quiet', 15, 4, 'Firefighter captain leading a team in emergency response and rescue', 10, null, 6);
insert into User (Name, Email, Role, PermissionsLevel) values ('Conn Dullard', 'cdullard@cargocollective.com', 'Business', 'searchingForCarpool', 2500, '6 months', 'Moderate', 'Adventurous', 55, 7, 'Cycling coach developing training programs for cyclists', 9, null, 1);
insert into User (Name, Email, Role, PermissionsLevel) values ('Everard Benedito', 'ebenedito@cargocollective.com', 'Computer Science', 'complete', 1600, '6 months', 'Messy', 'Outdoorsy', 20, 1, 'Dance choreographer creating routines for performances', 7, null, 9);
insert into User (Name, Email, Role, PermissionsLevel) values ('Roman Wais', 'rwais@cargocollective.com', 'Law', 'hasCar', 1350, '1 year', 'Very Clean', 'Introverted', 5, 5, 'Loves hiking and exploring nature trails', 3, null, 2);
insert into User (Name, Email, Role, PermissionsLevel) values ('Wynne Codrington', 'wcodrington@cargocollective.com', 'Art', 'notInterested', 1200, '4 months', 'Messy', 'Social', 60, 3, 'Hiking tour guide leading groups on scenic hikes and treks', 9, null, 1);
insert into User (Name, Email, Role, PermissionsLevel) values ('Paten Paskell', 'ppaskell@cargocollective.com', 'Art', 'hasCar', 1800, '1 year', 'Cluttered', 'Extroverted', 30, 7, 'Fashion designer creating unique clothing and accessories', 8, null, 5);
insert into User (Name, Email, Role, PermissionsLevel) values ('Dewey Tubby', 'dtubby@cargocollective.com', 'Mathematics', 'hasCar', 170, '6 months', 'Cluttered', 'Active', 45, 5, 'Antique enthusiast scouring flea markets for hidden treasures', 10, null, 7);
insert into User (Name, Email, Role, PermissionsLevel) values ('Banky Tapenden', 'btapenden@cargocollective.com', 'Computer Science', 'complete', 1800, '6 months', 'Messy', 'Active', 45, 6, 'Motorcycle rider exploring scenic routes on two wheels', 4, null, 4);
insert into User (Name, Email, Role, PermissionsLevel) values ('Worden Gansbuhler', 'wgansbuhler@cargocollective.com', 'Biology', 'searchingForCarpool', 1900, '1 year', 'Cluttered', 'Introverted', 15, 6, 'Travel blogger sharing adventures and tips with readers', 8, null, 8);
insert into User (Name, Email, Role, PermissionsLevel) values ('Barbara Brenneke', 'bbrenneke@cargocollective.com', 'Computer Science', 'complete', 1200, '6 months', 'Clean', 'Active', 5, 6, 'Dedicated yogi practicing mindfulness and meditation', 8, null, 8);
insert into User (Name, Email, Role, PermissionsLevel) values ('Kimbra Absolon', 'kabsolon@cargocollective.com', 'Mathematics', 'notInterested', 1350, '1 year', 'Moderate', 'Active', 75, 5, 'Environmental advocate promoting conservation and eco-friendly practices', 9, null, 2);
insert into User (Name, Email, Role, PermissionsLevel) values ('Jayson Eitter', 'jeitter@cargocollective.com', 'Business', 'hasCar', 1150, '6 months', 'Moderate', 'Adventurous', 15, 4, 'Astrologer providing readings and insights based on celestial movements', 3, null, 7);
insert into User (Name, Email, Role, PermissionsLevel) values ('Leonie McGenn', 'lmcgenn@cargocollective.com', 'Finance', 'complete', 170, '1 year', 'Moderate', 'Social', 25, 1, 'Comic book collector preserving rare editions and memorabilia', 2, null, 3);
insert into User (Name, Email, Role, PermissionsLevel) values ('Andriette Playhill', 'aplayhill@cargocollective.com', 'Art', 'complete', 1150, '4 months', 'Messy', 'Outdoorsy', 35, 5, 'Antique dealer specializing in unique and valuable antiques', 9, null, 8);
insert into User (Name, Email, Role, PermissionsLevel) values ('Deena Peirce', 'dpeirce@cargocollective.com', 'Physics', 'hasCar', 1600, '4 months', 'Messy', 'Outdoorsy', 45, 2, 'Vintage car collector restoring classic automobiles', 10, null, 2);
insert into User (Name, Email, Role, PermissionsLevel) values ('Worthy Schreurs', 'wschreurs@cargocollective.com', 'Chemistry', 'notInterested', 1000, '4 months', 'Clean', 'Extroverted', 10, 3, 'Foodie exploring different cuisines and restaurants', 2, null, 4);
insert into User (Name, Email, Role, PermissionsLevel) values ('Gabriel Dedrick', 'gdedrick@cargocollective.com', 'Business', 'searchingForCarpool', 3000, '1 year', 'Moderate', 'Quiet', 20, 6, 'Dance choreographer creating routines for performances', 4, null, 9);
insert into User (Name, Email, Role, PermissionsLevel) values ('Dixie Delgardo', 'ddelgardo@cargocollective.com', 'Computer Science', 'notInterested', 2000, '6 months', 'Clean', 'Introverted', 40, 1, 'Crafting enthusiast creating handmade gifts and decorations', 6, null, 8);
insert into User (Name, Email, Role, PermissionsLevel) values ('Amargo Weatherill', 'aweatherill@cargocollective.com', 'Finance', 'searchingForCarpool', 1150, '6 months', 'Moderate', 'Adventurous', 10, 3, 'Antique dealer specializing in unique and valuable antiques', 2, null, 5);
insert into User (Name, Email, Role, PermissionsLevel) values ('Jack Amos', 'jamos@cargocollective.com', 'Finance', 'complete', 1900, '1 year', 'Clean', 'Quiet', 60, 7, 'Scuba diver exploring underwater ecosystems and marine life', 9, null, 9);
insert into User (Name, Email, Role, PermissionsLevel) values ('Alis Trimbey', 'atrimbey@cargocollective.com', 'Law', 'searchingForCarpool', 1000, '6 months', 'Cluttered', 'Quiet', 25, 1, 'Hiking guide leading groups on challenging mountain trails', 5, null, 6);
insert into User (Name, Email, Role, PermissionsLevel) values ('Kacey Outram', 'koutram@cargocollective.com', 'Computer Science', 'complete', 1000, '6 months', 'Disorganized', 'Outdoorsy', 35, 6, 'Devoted animal lover volunteering at shelters', 8, null, 2);
insert into User (Name, Email, Role, PermissionsLevel) values ('Maddie Rodda', 'mrodda@cargocollective.com', 'Mathematics', 'searchingForCarpool', 1350, '6 months', 'Disorganized', 'Extroverted', 35, 1, 'Dedicated yogi practicing mindfulness and meditation', 7, null, 7);
insert into User (Name, Email, Role, PermissionsLevel) values ('Vivianna Propper', 'vpropper@cargocollective.com', 'Computer Science', 'searchingForRoommates', 170, '4 months', 'Messy', 'Introverted', 35, 6, 'Marathon runner training for long-distance races', 4, null, 7);
insert into User (Name, Email, Role, PermissionsLevel) values ('Hebert Jurries', 'hjurries@cargocollective.com', 'Physics', 'searchingForCarpool', 1200, '4 months', 'Moderate', 'Extroverted', 15, 7, 'Photography teacher instructing students on composition and lighting', 6, null, 2);
insert into User (Name, Email, Role, PermissionsLevel) values ('Dorothee Tomaini', 'dtomaini@cargocollective.com', 'Biology', 'notInterested', 1000, '1 year', 'Disorganized', 'Introverted', 45, 5, 'Book publisher releasing new titles and bestsellers', 1, null, 5);
insert into User (Name, Email, Role, PermissionsLevel) values ('Kaiser Chitter', 'kchitter@cargocollective.com', 'Physics', 'complete', 1800, '1 year', 'Messy', 'Extroverted', 10, 1, 'Surfing school owner offering lessons and rentals for surfers', 1, null, 3);
insert into User (Name, Email, Role, PermissionsLevel) values ('Jerry Himsworth', 'jhimsworth@cargocollective.com', 'Mathematics', 'notInterested', 3000, '6 months', 'Very Clean', 'Quiet', 5, 1, 'Rock climbing coach training climbers on techniques and safety', 2, null, 5);
insert into User (Name, Email, Role, PermissionsLevel) values ('Delcina Lies', 'dlies@cargocollective.com', 'Psychology', 'hasCar', 1150, '4 months', 'Clean', 'Extroverted', 30, 3, 'Passionate about cooking and trying new recipes', 6, null, 7);
insert into User (Name, Email, Role, PermissionsLevel) values ('Britni Cowden', 'bcowden@cargocollective.com', 'Finance', 'searchingForCarpool', 1200, '6 months', 'Very Clean', 'Social', 20, 7, 'Birdwatching guide leading tours to spot rare and exotic birds', 2, null, 4);
insert into User (Name, Email, Role, PermissionsLevel) values ('Reinald Swancock', 'rswancock@cargocollective.com', 'Finance', 'hasCar', 1600, '6 months', 'Clean', 'Outdoorsy', 30, 3, 'Gardening expert cultivating a lush and vibrant garden', 8, null, 3);
insert into User (Name, Email, Role, PermissionsLevel) values ('Adel Gatsby', 'agatsby@cargocollective.com', 'Business', 'searchingForRoommates', 2500, '6 months', 'Very Clean', 'Outdoorsy', 40, 7, 'Sports journalist reporting on games and athletes', 4, null, 2);
insert into User (Name, Email, Role, PermissionsLevel) values ('Stace Muffett', 'smuffett@cargocollective.com', 'Psychology', 'searchingForCarpool', 3000, '4 months', 'Very Clean', 'Extroverted', 15, 4, 'Dance studio owner providing classes in various dance styles', 3, null, 10);
insert into User (Name, Email, Role, PermissionsLevel) values ('Ardelis Benoey', 'abenoey@cargocollective.com', 'Art', 'complete', 1150, '4 months', 'Disorganized', 'Quiet', 5, 1, 'Dance enthusiast taking classes in various styles', 10, null, 4);
insert into User (Name, Email, Role, PermissionsLevel) values ('Allan Ivoshin', 'aivoshin@cargocollective.com', 'Computer Science', 'notInterested', 1800, '6 months', 'Cluttered', 'Outdoorsy', 10, 2, 'Dedicated yogi practicing mindfulness and meditation', 4, null, 2);
insert into User (Name, Email, Role, PermissionsLevel) values ('Brandea Blance', 'bblance@cargocollective.com', 'Finance', 'notInterested', 1200, '6 months', 'Disorganized', 'Outdoorsy', 60, 2, 'Motorcycle racer competing in races and rallies', 3, null, 10);
insert into User (Name, Email, Role, PermissionsLevel) values ('Charil Staresmeare', 'cstaresmeare@cargocollective.com', 'Biology', 'notInterested', 1600, '4 months', 'Moderate', 'Active', 35, 3, 'Birdwatcher spotting rare species in their natural habitats', 5, null, 10);
insert into User (Name, Email, Role, PermissionsLevel) values ('Fleming Wardlow', 'fwardlow@cargocollective.com', 'Physics', 'complete', 1900, '6 months', 'Disorganized', 'Social', 5, 4, 'Fitness instructor leading group exercise classes', 2, null, 5);
insert into User (Name, Email, Role, PermissionsLevel) values ('Marillin Peasnone', 'mpeasnone@cargocollective.com', 'Computer Science', 'searchingForCarpool', 1200, '4 months', 'Disorganized', 'Social', 40, 1, 'Travel blogger sharing adventures and tips with readers', 7, null, 7);
insert into User (Name, Email, Role, PermissionsLevel) values ('Fidel Dootson', 'fdootson@cargocollective.com', 'Mathematics', 'notInterested', 2000, '6 months', 'Disorganized', 'Introverted', 45, 1, 'Tech geek experimenting with the latest gadgets and software', 9, null, 8);
insert into User (Name, Email, Role, PermissionsLevel) values ('Arturo Gerling', 'agerling@cargocollective.com', 'Physics', 'notInterested', 3000, '1 year', 'Very Clean', 'Introverted', 30, 1, 'Dance choreographer creating routines for performances', 1, null, 3);
insert into User (Name, Email, Role, PermissionsLevel) values ('Leopold Tremble', 'ltremble@cargocollective.com', 'Chemistry', 'notInterested', 2500, '4 months', 'Messy', 'Outdoorsy', 10, 6, 'Sailing captain leading sailing expeditions and charters', 3, null, 8);
insert into User (Name, Email, Role, PermissionsLevel) values ('Channa Pitrelli', 'cpitrelli@cargocollective.com', 'Art', 'complete', 170, '6 months', 'Cluttered', 'Quiet', 75, 4, 'Art collector acquiring works from emerging and established artists', 4, null, 6);
insert into User (Name, Email, Role, PermissionsLevel) values ('Rochella Ranns', 'rranns@cargocollective.com', 'Chemistry', 'complete', 2000, '4 months', 'Messy', 'Introverted', 75, 3, 'Tech geek experimenting with the latest gadgets and software', 7, null, 4);
insert into User (Name, Email, Role, PermissionsLevel) values ('Fae Maffione', 'fmaffione@cargocollective.com', 'Computer Science', 'complete', 1150, '6 months', 'Cluttered', 'Quiet', 55, 5, 'Vintage car restorer refurbishing classic vehicles to their former glory', 9, null, 1);
insert into User (Name, Email, Role, PermissionsLevel) values ('Nealson Coundley', 'ncoundley@cargocollective.com', 'Art', 'hasCar', 2000, '1 year', 'Very Clean', 'Adventurous', 30, 7, 'History buff visiting museums and historical sites', 1, null, 10);
insert into User (Name, Email, Role, PermissionsLevel) values ('Jaimie Tappin', 'jtappin@cargocollective.com', 'Biology', 'searchingForCarpool', 2000, '4 months', 'Clean', 'Social', 45, 7, 'Thrives on adrenaline with extreme sports like skydiving and bungee jumping', 3, null, 10);
insert into User (Name, Email, Role, PermissionsLevel) values ('Susanna Pykerman', 'spykerman@cargocollective.com', 'Law', 'complete', 2000, '6 months', 'Clean', 'Adventurous', 30, 3, 'Avid collector of vintage vinyl records', 7, null, 7);
insert into User (Name, Email, Role, PermissionsLevel) values ('Leda Standish-Brooks', 'lstandishbrooks@cargocollective.com', 'Law', 'hasCar', 2500, '1 year', 'Messy', 'Introverted', 60, 1, 'Sports fan cheering for their favorite teams at games', 9, null, 10);
insert into User (Name, Email, Role, PermissionsLevel) values ('Alfredo Verling', 'averling@cargocollective.com', 'Physics', 'notInterested', 1200, '4 months', 'Very Clean', 'Social', 55, 7, 'Photography teacher instructing students on composition and lighting', 6, null, 3);
insert into User (Name, Email, Role, PermissionsLevel) values ('Kristina Orteu', 'korte@cargocollective.com', 'Chemistry', 'complete', 1600, '4 months', 'Moderate', 'Introverted', 15, 5, 'Crafting enthusiast creating handmade gifts and decorations', 3, null, 3);
insert into User (Name, Email, Role, PermissionsLevel) values ('Darcee Itzkowicz', 'ditzkowicz@cargocollective.com', 'Chemistry', 'hasCar', 170, '6 months', 'Very Clean', 'Introverted', 5, 2, 'Chess master competing in international tournaments and championships', 10, null, 10);
insert into User (Name, Email, Role, PermissionsLevel) values ('Brigg Braidley', 'bbraidley@cargocollective.com', 'Biology', 'searchingForCarpool', 1600, '4 months', 'Very Clean', 'Introverted', 55, 1, 'Environmental advocate promoting conservation and eco-friendly practices', 7, null, 8);
insert into User (Name, Email, Role, PermissionsLevel) values ('Jade Waplington', 'jwaplington@cargocollective.com', 'Finance', 'hasCar', 2500, '4 months', 'Very Clean', 'Introverted', 30, 6, 'Environmental advocate promoting conservation and eco-friendly practices', 4, null, 9);
insert into User (Name, Email, Role, PermissionsLevel) values ('Claire Mallender', 'cmallender@cargocollective.com', 'Biology', 'complete', 1200, '6 months', 'Disorganized', 'Active', 10, 6, 'Vintage car restorer refurbishing classic vehicles to their former glory', 1, null, 10);
insert into User (Name, Email, Role, PermissionsLevel) values ('Wileen Loveman', 'wloveman@cargocollective.com', 'Biology', 'complete', 3000, '4 months', 'Very Clean', 'Social', 20, 6, 'History professor researching and teaching historical events', 2, null, 1);
insert into User (Name, Email, Role, PermissionsLevel) values ('Shannon Eagar', 'seagar@cargocollective.com', 'Chemistry', 'complete', 1000, '1 year', 'Cluttered', 'Adventurous', 30, 2, 'Sailing captain leading sailing expeditions and charters', 8, null, 1);
insert into User (Name, Email, Role, PermissionsLevel) values ('Nikita Ferronet', 'nferonet@cargocollective.com', 'Computer Science', 'complete', 2000, '6 months', 'Clean', 'Social', 5, 1, 'Vintage car collector restoring classic automobiles', 3, null, 2);
insert into User (Name, Email, Role, PermissionsLevel) values ('Quinn Corner', 'qcorner@cargocollective.com', 'Biology', 'complete', 1800, '1 year', 'Cluttered', 'Active', 20, 1, 'Gaming streamer broadcasting gameplay and interacting with viewers', 3, null, 9);
insert into User (Name, Email, Role, PermissionsLevel) values ('Hewie Speek', 'hspeek@cargocollective.com', 'Art', 'complete', 2000, '1 year', 'Moderate', 'Adventurous', 75, 1, 'Antique dealer specializing in unique and valuable antiques', 5, null, 6);
insert into User (Name, Email, Role, PermissionsLevel) values ('Ronica Maplethorp', 'rmaplethorp@cargocollective.com', 'Law', 'searchingForRoommates', 1800, '4 months', 'Cluttered', 'Social', 10, 2, 'Travel blogger sharing adventures and tips with readers', 10, null, 7);
insert into User (Name, Email, Role, PermissionsLevel) values ('Blair Shedden', 'bshedden@cargocollective.com', 'Physics', 'searchingForCarpool', 2000, '6 months', 'Disorganized', 'Extroverted', 25, 4, 'Tech geek experimenting with the latest gadgets and software', 7, null, 4);
insert into User (Name, Email, Role, PermissionsLevel) values ('Nolly Petry', 'npetry@cargocollective.com', 'Law', 'complete', 1000, '6 months', 'Disorganized', 'Social', 55, 5, 'Fashion designer creating unique clothing and accessories', 5, null, 2);
insert into User (Name, Email, Role, PermissionsLevel) values ('Flemming Gatecliffe', 'fgatecliffe@cargocollective.com', 'Computer Science', 'notInterested', 170, '1 year', 'Cluttered', 'Introverted', 75, 2, 'Tech entrepreneur developing innovative solutions and products', 9, null, 7);
insert into User (Name, Email, Role, PermissionsLevel) values ('Prince Stickells', 'pstickells@cargocollective.com', 'Finance', 'hasCar', 2500, '4 months', 'Cluttered', 'Social', 30, 1, 'Dance choreographer creating routines for performances', 9, null, 5);
insert into User (Name, Email, Role, PermissionsLevel) values ('Moselle Huddy', 'mhuudy@cargocollective.com', 'Biology', 'searchingForHousing', 1350, '4 months', 'Disorganized', 'Social', 5, 2, 'Thrives on adrenaline with extreme sports like skydiving and bungee jumping', 4, null, 10);
insert into User (Name, Email, Role, PermissionsLevel) values ('Fraser Crippill', 'fcrippill@cargocollective.com', 'Physics', 'notInterested', 1900, '1 year', 'Disorganized', 'Extroverted', 15, 2, 'Environmental advocate promoting conservation and eco-friendly practices', 10, null, 3);
insert into User (Name, Email, Role, PermissionsLevel) values ('Jenda Wrinch', 'jwrinch@cargocollective.com', 'Psychology', 'complete', 1000, '6 months', 'Very Clean', 'Outdoorsy', 35, 1, 'Gardening expert cultivating a lush and vibrant garden', 9, null, 4);
insert into User (Name, Email, Role, PermissionsLevel) values ('Corliss Lavallie', 'clavallie@cargocollective.com', 'Chemistry', 'hasCar', 2500, '6 months', 'Clean', 'Social', 55, 2, 'History buff visiting museums and historical sites', 1, null, 6);
insert into User (Name, Email, Role, PermissionsLevel) values ('Ivonne Wickrath', 'iwickrath@cargocollective.com', 'Art', 'complete', 3000, '4 months', 'Moderate', 'Quiet', 75, 7, 'Keen gardener growing a variety of fruits and vegetables', 7, null, 6);
insert into User (Name, Email, Role, PermissionsLevel) values ('Pearline Grumell', 'pgrumell@cargocollective.com', 'Chemistry', 'complete', 3000, '6 months', 'Messy', 'Social', 30, 1, 'Gamer immersing themselves in virtual worlds and online competitions', 5, null, 1);
insert into User (Name, Email, Role, PermissionsLevel) values ('Susannah Raddan', 'sraddan@cargocollective.com', 'Art', 'hasCar', 1800, '4 months', 'Clean', 'Adventurous', 75, 5, 'Book publisher releasing new titles and bestsellers', 5, null, 3);
insert into User (Name, Email, Role, PermissionsLevel) values ('Delila Coulbeck', 'doulbeck@cargocollective.com', 'Psychology', 'complete', 2500, '4 months', 'Cluttered', 'Active', 45, 2, 'Wine connoisseur tasting and collecting fine wines', 2, null, 4);
insert into User (Name, Email, Role, PermissionsLevel) values ('Berton Harmeston', 'bharmeston@cargocollective.com', 'Biology', 'hasCar', 1000, '1 year', 'Moderate', 'Quiet', 60, 1, 'Vintage car collector restoring classic automobiles', 8, null, 8);
insert into User (Name, Email, Role, PermissionsLevel) values ('Donalt Gunning', 'dgunning@cargocollective.com', 'Finance', 'notInterested', 1200, '4 months', 'Clean', 'Quiet', 30, 2, 'Astrologer providing readings and insights based on celestial movements', 9, null, 2);
insert into User (Name, Email, Role, PermissionsLevel) values ('Tymon Neilus', 'tneilus@cargocollective.com', 'Biology', 'complete', 1600, '4 months', 'Cluttered', 'Quiet', 30, 7, 'Soccer coach training players on skills and strategies for the game', 9, null, 6);
insert into User (Name, Email, Role, PermissionsLevel) values ('Leoine Oswell', 'loswell@cargocollective.com', 'Art', 'complete', 1150, '1 year', 'Messy', 'Social', 45, 5, 'Antique enthusiast scouring flea markets for hidden treasures', 9, null, 2);
insert into User (Name, Email, Role, PermissionsLevel) values ('Gerry Gatecliff', 'ggatecliff@cargocollective.com', 'Finance', 'searchingForCarpool', 1600, '1 year', 'Clean', 'Outdoorsy', 45, 6, 'Sports commentator providing analysis and commentary on games', 9, null, 2);
insert into User (Name, Email, Role, PermissionsLevel) values ('Marissa Broun', 'mbroun@cargocollective.com', 'Finance', 'complete', 3000, '1 year', 'Cluttered', 'Extroverted', 45, 1, 'Obsessed with DIY home improvement projects', 6, null, 8);
insert into User (Name, Email, Role, PermissionsLevel) values ('Letty Mewton', 'lmeeton@cargocollective.com', 'Physics', 'complete', 1150, '4 months', 'Moderate', 'Quiet', 45, 5, 'Music festival organizer planning and coordinating live music events', 9, null, 7);
insert into User (Name, Email, Role, PermissionsLevel) values ('Arthur Gave', 'agave@cargocollective.com', 'Business', 'notInterested', 2500, '6 months', 'Disorganized', 'Extroverted', 40, 3, 'Fitness influencer inspiring followers with workout routines and tips', 3, null, 3);
insert into User (Name, Email, Role, PermissionsLevel) values ('Joleen Satterly', 'jsatterly@cargocollective.com', 'Physics', 'searchingForHousing', 1600, '6 months', 'Moderate', 'Adventurous', 75, 4, 'Rock climbing coach training climbers on techniques and safety', 9, null, 2);
insert into User (Name, Email, Role, PermissionsLevel) values ('Wheeler Martynka', 'wmartynka@cargocollective.com', 'Business', 'searchingForCarpool', 1350, '6 months', 'Disorganized', 'Adventurous', 10, 5, 'Rock climbing coach training climbers on techniques and safety', 5, null, 4);
insert into User (Name, Email, Role, PermissionsLevel) values ('Marys Hannaby', 'mhanaby@cargocollective.com', 'Art', 'searchingForHousing', 170, '1 year', 'Cluttered', 'Active', 30, 6, 'Surfing enthusiast catching waves at the beach', 10, null, 4);
insert into User (Name, Email, Role, PermissionsLevel) values ('Ariel Gabotti', 'agabotti@cargocollective.com', 'Biology', 'complete', 3000, '1 year', 'Moderate', 'Introverted', 60, 6, 'Soccer coach training players on skills and strategies for the game', 1, null, 9);

-- 4. Advisor Data (no dependencies)
insert into Advisor (Name, Email, Department) values ('John Smith', 'jsmith@university.edu', 'Computer Science');
insert into Advisor (Name, Email, Department) values ('Sarah Johnson', 'sjohnson@university.edu', 'Engineering');
insert into Advisor (Name, Email, Department) values ('Jessica Doofenshmirtz', 'gmccard0@nps.gov', 'Khoury College', 8);
insert into Advisor (Name, Email, Department, StudentID) values ('Babbette Marle', 'bmarle1@bbc.co.uk', 'College of Engineering', 50);
insert into Advisor (Name, Email, Department, StudentID) values ('Lena Graver', 'lgraver2@creativecommons.org', 'D''Amore Mc-Kim', 99);
insert into Advisor (Name, Email, Department, StudentID) values ('Kevina Garden', 'kgarden3@sina.com.cn', 'College of Science', 38);
insert into Advisor (Name, Email, Department, StudentID) values ('Cathryn Tatershall', 'ctatershall4@free.fr', 'Bouve College', 14);
insert into Advisor (Name, Email, Department, StudentID) values ('Domingo Stanlick', 'dstanlick5@arstechnica.com', 'College of Science', 77);
insert into Advisor (Name, Email, Department, StudentID) values ('Joyous Ferby', 'jferby6@yahoo.com', 'Khoury College', 91);
insert into Advisor (Name, Email, Department, StudentID) values ('Thibaut Biles', 'tbiles7@4shared.com', 'College of Engineering', 17);
insert into Advisor (Name, Email, Department, StudentID) values ('Tana Roblou', 'troblou8@cargocollective.com', 'D''Amore Mc-Kim', 26);
insert into Advisor (Name, Email, Department, StudentID) values ('Sheridan Gunny', 'sgunny9@arizona.edu', 'College of Science', 65);

-- 5. Student Data (depends on CityCommunity, Housing, and Advisor)
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Leland Izaks', 'Computer Science', 'Eire', 'San Jose', 'Searching for Housing', 
    'Not Interested', 1350, '1 year', 'Cluttered', 'Social', 15, 1, 
    'Gamer immersing themselves in virtual worlds and online competitions', 1, 1, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Demetris Dury', 'Computer Science', 'Photospace', 'San Jose', 'Searching for Roommates', 
    'Searching for Carpool', 1800, '4 months', 'Moderate', 'Active', 75, 2, 
    'Music festival organizer planning and coordinating live music events', 2, 2, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Zelig Matuszinski', 'Physics', 'Podcat', 'London', 'Not Interested', 
    'Not Interested', 3000, '4 months', 'Moderate', 'Quiet', 55, 1, 
    'Wine connoisseur tasting and collecting fine wines', 3, 3, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Lonni Duke', 'Business', 'Jabbercube', 'Boston', 'Searching for Housing', 
    'Not Interested', 1150, '4 months', 'Disorganized', 'Introverted', 45, 3, 
    'Avid collector of vintage vinyl records', 4, 4, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Gannie Dearness', 'Business', 'Youspan', 'San Jose', 'Searching for Roommates', 
    'Searching for Carpool', 2000, '6 months', 'Cluttered', 'Extroverted', 75, 1, 
    'Sailing captain leading sailing expeditions and charters', 5, 5, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Garnet Mathieson', 'Chemistry', 'Realbuzz', 'London', 'Complete', 
    'Searching for Carpool', 1350, '6 months', 'Clean', 'Adventurous', 45, 7, 
    'Vintage car collector restoring classic automobiles', 6, 6, 6);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Valeria Algore', 'Psychology', 'Quimba', 'Seattle', 'Searching for Housing', 
    'Has Car', 1600, '6 months', 'Very Clean', 'Adventurous', 40, 4, 
    'Travel photographer capturing stunning landscapes and cultures', 7, 7, 7);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Lita Delahunty', 'Biology', 'Fivebridge', 'Los Angeles', 'Searching for Roommates', 
    'Not Interested', 1800, '4 months', 'Moderate', 'Quiet', 40, 7, 
    'Tech geek experimenting with the latest gadgets and software', 8, 8, 8);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Tanitansy Wallhead', 'Computer Science', 'Kanoodle', 'London', 'Searching for Housing', 
    'Searching for Carpool', 1200, '6 months', 'Moderate', 'Outdoorsy', 55, 4, 
    'Dance studio owner providing classes in various dance styles', 9, 9, 9);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Fleur Vitet', 'Psychology', 'Shuffledrive', 'D.C.', 'Searching for Housing', 
    'Has Car', 2000, '4 months', 'Disorganized', 'Quiet', 10, 4, 
    'Soccer player training for matches and tournaments', 10, 10, 10);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Celie Franchi', 'Finance', 'Jaxspan', 'Seattle', 'Searching for Housing', 
    'Has Car', 2500, '1 year', 'Messy', 'Extroverted', 5, 5, 
    'Dance choreographer creating routines for performances', 11, 11, 11);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Thaddus Pettiford', 'Business', 'Meejo', 'San Francisco', 'Not Interested', 
    'Has Car', 2500, '4 months', 'Disorganized', 'Active', 55, 7, 
    'Comic book store owner selling rare and collectible comics', 12, 12, 12);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Aprilette Kidd', 'Computer Science', 'Kaymbo', 'San Francisco', 'Not Interested', 
    'Complete', 2000, '6 months', 'Disorganized', 'Extroverted', 75, 6, 
    'Chess master competing in international tournaments and championships', 13, 13, 13);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Simone Fishbourne', 'Art', 'Gigabox', 'Los Angeles', 'Searching for Roommates', 
    'Complete', 1600, '6 months', 'Disorganized', 'Adventurous', 30, 7, 
    'Music aficionado attending concerts and music festivals', 14, 14, 14);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Jonis MacAlaster', 'Finance', 'Babbleblab', 'San Jose', 'Searching for Roommates', 
    'Has Car', 170, '6 months', 'Messy', 'Quiet', 40, 3, 
    'Yoga studio owner providing classes in relaxation and mindfulness', 15, 15, 15);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Collette Lazenby', 'Finance', 'Gigaclub', 'D.C.', 'Searching for Housing', 
    'Has Car', 3000, '4 months', 'Cluttered', 'Quiet', 15, 4, 
    'Firefighter captain leading a team in emergency response and rescue', 16, 16, 16);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Conn Dullard', 'Business', 'Feednation', 'New York City', 'Not Interested', 
    'Searching for Carpool', 2500, '6 months', 'Moderate', 'Adventurous', 55, 7, 
    'Cycling coach developing training programs for cyclists', 17, 17, 17);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Everard Benedito', 'Computer Science', 'Zoomcast', 'San Francisco', 'Searching for Housing', 
    'Complete', 1600, '6 months', 'Messy', 'Outdoorsy', 20, 1, 
    'Dance choreographer creating routines for performances', 18, 18, 18);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Roman Wais', 'Law', 'Eire', 'Atlanta', 'Complete', 'Has Car', 1350, '1 year', 'Very Clean', 'Introverted', 5, 5, 
    'Loves hiking and exploring nature trails', 19, 19, 19);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Wynne Codrington', 'Art', 'Topiczoom', 'San Jose', 'Not Interested', 
    'Not Interested', 1200, '4 months', 'Messy', 'Social', 60, 3, 
    'Hiking tour guide leading groups on scenic hikes and treks', 20, 20, 20);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Paten Paskell', 'Art', 'Plambee', 'New York City', 'Searching for Roommates', 
    'Has Car', 1800, '1 year', 'Cluttered', 'Extroverted', 30, 7, 
    'Fashion designer creating unique clothing and accessories', 21, 21, 21);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Dewey Tubby', 'Mathematics', 'Miboo', 'Los Angeles', 'Not Interested', 
    'Has Car', 170, '6 months', 'Cluttered', 'Active', 45, 5, 
    'Antique enthusiast scouring flea markets for hidden treasures', 22, 22, 22);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Banky Tapenden', 'Computer Science', 'Yozio', 'Atlanta', 'Complete', 
    'Searching for Carpool', 1800, '6 months', 'Messy', 'Active', 45, 6, 
    'Motorcycle rider exploring scenic routes on two wheels', 23, 23, 23);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Worden Gansbuhler', 'Biology', 'Zoomlounge', 'New York City', 'Searching for Housing', 
    'Searching for Carpool', 1900, '1 year', 'Cluttered', 'Introverted', 15, 6, 
    'Travel blogger sharing adventures and tips with readers', 24, 24, 24);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Barbara Brenneke', 'Computer Science', 'Meetz', 'Seattle', 'Searching for Housing', 
    'Complete', 1200, '6 months', 'Clean', 'Active', 5, 6, 
    'Dedicated yogi practicing mindfulness and meditation', 25, 25, 25);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Kimbra Absolon', 'Mathematics', 'Shuffletag', 'San Francisco', 'Not Interested', 
    'Not Interested', 1350, '1 year', 'Moderate', 'Active', 75, 5, 
    'Environmental advocate promoting conservation and eco-friendly practices', 26, 26, 26);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Jayson Eitter', 'Business', 'Brainlounge', 'Atlanta', 'Searching for Housing', 
    'Has Car', 1150, '6 months', 'Moderate', 'Adventurous', 15, 4, 
    'Astrologer providing readings and insights based on celestial movements', 27, 27, 27);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Leonie McGenn', 'Finance', 'Mita', 'Boston', 'Searching for Housing', 
    'Complete', 170, '1 year', 'Moderate', 'Social', 25, 1, 
    'Comic book collector preserving rare editions and memorabilia', 28, 28, 28);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Andriette Playhill', 'Art', 'Roombo', 'London', 'Not Interested', 
    'Complete', 1150, '4 months', 'Messy', 'Outdoorsy', 35, 5, 
    'Antique dealer specializing in unique and valuable antiques', 29, 29, 29);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Deena Peirce', 'Physics', 'Yodel', 'Boston', 'Complete', 'Has Car', 1600, '4 months', 
    'Messy', 'Outdoorsy', 45, 2, 'Vintage car collector restoring classic automobiles', 30, 30, 30);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Worthy Schreurs', 'Chemistry', 'Topicblab', 'Chicago', 'Complete', 
    'Not Interested', 1000, '4 months', 'Clean', 'Extroverted', 10, 3, 
    'Foodie exploring different cuisines and restaurants', 31, 31, 31);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Gabriel Dedrick', 'Business', 'Flipbug', 'Atlanta', 'Searching for Housing', 
    'Searching for Carpool', 3000, '1 year', 'Moderate', 'Quiet', 20, 6, 
    'Dance choreographer creating routines for performances', 32, 32, 32);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Dixie Delgardo', 'Computer Science', 'Trunyx', 'D.C.', 'Searching for Housing', 
    'Not Interested', 2000, '6 months', 'Clean', 'Introverted', 40, 1, 
    'Crafting enthusiast creating handmade gifts and decorations', 33, 33, 33);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Amargo Weatherill', 'Finance', 'Browsecat', 'San Francisco', 'Not Interested', 
    'Searching for Carpool', 1150, '6 months', 'Moderate', 'Adventurous', 10, 3, 
    'Antique dealer specializing in unique and valuable antiques', 34, 34, 34);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Jack Amos', 'Finance', 'Eimbee', 'San Jose', 'Not Interested', 'Complete', 1900, '1 year', 'Clean', 'Quiet', 60, 7, 
    'Scuba diver exploring underwater ecosystems and marine life', 35, 35, 35);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Alis Trimbey', 'Law', 'Devpulse', 'New York City', 'Searching for Roommates', 
    'Searching for Carpool', 1000, '6 months', 'Cluttered', 'Quiet', 25, 1, 
    'Hiking guide leading groups on challenging mountain trails', 36, 36, 36);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Kacey Outram', 'Computer Science', 'Gigazoom', 'San Jose', 'Complete', 
    'Searching for Carpool', 1000, '6 months', 'Disorganized', 'Outdoorsy', 35, 6, 
    'Devoted animal lover volunteering at shelters', 37, 37, 37);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Maddie Rodda', 'Mathematics', 'Dabjam', 'San Jose', 'Searching for Roommates', 
    'Searching for Carpool', 1350, '6 months', 'Disorganized', 'Extroverted', 35, 1, 
    'Dedicated yogi practicing mindfulness and meditation', 38, 38, 38);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Vivianna Propper', 'Computer Science', 'Thoughtmix', 'London', 'Searching for Roommates', 
    'Searching for Carpool', 170, '4 months', 'Messy', 'Introverted', 35, 6, 
    'Marathon runner training for long-distance races', 39, 39, 39);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Hebert Jurries', 'Physics', 'Avamm', 'Los Angeles', 'Searching for Roommates', 
    'Searching for Carpool', 1200, '4 months', 'Moderate', 'Extroverted', 15, 7, 
    'Photography teacher instructing students on composition and lighting', 40, 40, 40);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Dorothee Tomaini', 'Biology', 'Rhybox', 'Chicago', 'Not Interested', 
    'Not Interested', 1000, '1 year', 'Disorganized', 'Introverted', 45, 5, 
    'Book publisher releasing new titles and bestsellers', 41, 41, 41);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Kaiser Chitter', 'Physics', 'Thoughtbridge', 'Seattle', 'Searching for Housing', 
    'Complete', 1800, '1 year', 'Messy', 'Extroverted', 10, 1, 
    'Surfing school owner offering lessons and rentals for surfers', 42, 42, 42);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Jerry Himsworth', 'Mathematics', 'Quatz', 'Boston', 'Searching for Housing', 
    'Not Interested', 3000, '6 months', 'Very Clean', 'Quiet', 5, 1, 
    'Rock climbing coach training climbers on techniques and safety', 43, 43, 43);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Delcina Lies', 'Psychology', 'Dynabox', 'San Francisco', 'Not Interested', 
    'Has Car', 1150, '4 months', 'Clean', 'Extroverted', 30, 3, 
    'Passionate about cooking and trying new recipes', 44, 44, 44);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Britni Cowden', 'Finance', 'Tagtune', 'Atlanta', 'Not Interested', 
    'Searching for Carpool', 1200, '6 months', 'Very Clean', 'Social', 20, 7, 
    'Birdwatching guide leading tours to spot rare and exotic birds', 45, 45, 45);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Reinald Swancock', 'Finance', 'Thoughtstorm', 'San Jose', 'Searching for Roommates', 
    'Has Car', 1600, '6 months', 'Clean', 'Outdoorsy', 30, 3, 
    'Gardening expert cultivating a lush and vibrant garden', 46, 46, 46);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Adel Gatsby', 'Business', 'Yodo', 'Atlanta', 'Searching for Roommates', 
    'Searching for Carpool', 2500, '6 months', 'Very Clean', 'Outdoorsy', 40, 7, 
    'Sports journalist reporting on games and athletes', 47, 47, 47);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Stace Muffett', 'Psychology', 'Midel', 'San Francisco', 'Not Interested', 
    'Searching for Carpool', 3000, '4 months', 'Very Clean', 'Extroverted', 15, 4, 
    'Dance studio owner providing classes in various dance styles', 48, 48, 48);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Ardelis Benoey', 'Art', 'Aimbu', 'Seattle', 'Complete', 'Searching for Carpool', 
    1150, '4 months', 'Disorganized', 'Quiet', 5, 1, 'Dance enthusiast taking classes in various styles', 49, 49, 49);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Allan Ivoshin', 'Computer Science', 'JumpXS', 'Los Angeles', 'Not Interested', 
    'Complete', 1800, '6 months', 'Cluttered', 'Outdoorsy', 10, 2, 
    'Dedicated yogi practicing mindfulness and meditation', 50, 50, 50);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Brandea Blance', 'Finance', 'Meembee', 'San Jose', 'Searching for Housing', 
    'Not Interested', 1200, '6 months', 'Disorganized', 'Outdoorsy', 60, 2, 
    'Motorcycle racer competing in races and rallies', 51, 51, 51);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Charil Staresmeare', 'Biology', 'Meembee', 'San Francisco', 'Not Interested', 
    'Not Interested', 1600, '4 months', 'Moderate', 'Active', 35, 3, 
    'Birdwatcher spotting rare species in their natural habitats', 52, 52, 52);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Fleming Wardlow', 'Physics', 'Youopia', 'Seattle', 'Complete', 'Complete', 
    1900, '6 months', 'Disorganized', 'Social', 5, 4, 'Fitness instructor leading group exercise classes', 53, 53, 53);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Marillin Peasnone', 'Computer Science', 'Wordpedia', 'Seattle', 'Searching for Housing', 
    'Searching for Carpool', 1200, '4 months', 'Disorganized', 'Social', 40, 1, 
    'Travel blogger sharing adventures and tips with readers', 54, 54, 54);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Fidel Dootson', 'Mathematics', 'Flipstorm', 'D.C.', 'Searching for Housing', 
    'Not Interested', 2000, '6 months', 'Disorganized', 'Introverted', 45, 1, 
    'Tech geek experimenting with the latest gadgets and software', 55, 55, 55);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Arturo Gerling', 'Physics', 'Photojam', 'D.C.', 'Not Interested', 'Complete', 
    3000, '1 year', 'Very Clean', 'Introverted', 30, 1, 'Dance choreographer creating routines for performances', 56, 56, 56);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Leopold Tremble', 'Chemistry', 'Pixope', 'London', 'Searching for Roommates', 
    'Not Interested', 2500, '4 months', 'Messy', 'Outdoorsy', 10, 6, 
    'Sailing captain leading sailing expeditions and charters', 57, 57, 57);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Channa Pitrelli', 'Art', 'Dabvine', 'San Francisco', 'Searching for Roommates', 
    'Complete', 170, '6 months', 'Cluttered', 'Quiet', 75, 4, 
    'Art collector acquiring works from emerging and established artists', 58, 58, 58);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Rochella Ranns', 'Chemistry', 'JumpXS', 'Los Angeles', 'Searching for Housing', 
    'Complete', 2000, '4 months', 'Messy', 'Introverted', 75, 3, 
    'Tech geek experimenting with the latest gadgets and software', 59, 59, 59);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Fae Maffione', 'Computer Science', 'Twitternation', 'D.C.', 'Searching for Housing', 
    'Complete', 1150, '6 months', 'Cluttered', 'Quiet', 55, 5, 
    'Vintage car restorer refurbishing classic vehicles to their former glory', 60, 60, 60);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Nealson Coundley', 'Art', 'Linkbuzz', 'London', 'Complete', 'Has Car', 
    2000, '1 year', 'Very Clean', 'Adventurous', 30, 7, 'History buff visiting museums and historical sites', 61, 61, 61);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Jaimie Tappin', 'Biology', 'Gigaclub', 'San Jose', 'Not Interested', 
    'Searching for Carpool', 2000, '4 months', 'Clean', 'Social', 45, 7, 
    'Thrives on adrenaline with extreme sports like skydiving and bungee jumping', 62, 62, 62);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Susanna Pykerman', 'Law', 'Centidel', 'Chicago', 'Not Interested', 
    'Searching for Carpool', 2000, '6 months', 'Clean', 'Adventurous', 30, 3, 
    'Avid collector of vintage vinyl records', 63, 63, 63);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Leda Standish-Brooks', 'Law', 'Eabox', 'Los Angeles', 'Complete', 'Has Car', 
    2500, '1 year', 'Messy', 'Introverted', 60, 1, 'Sports fan cheering for their favorite teams at games', 64, 64, 64);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Alfredo Verling', 'Physics', 'Livetube', 'San Jose', 'Complete', 'Not Interested', 
    1200, '4 months', 'Very Clean', 'Social', 55, 7, 'Photography teacher instructing students on composition and lighting', 65, 65, 65);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Kristina Orteu', 'Chemistry', 'Skiptube', 'Los Angeles', 'Not Interested', 
    'Complete', 1600, '4 months', 'Moderate', 'Introverted', 15, 5, 
    'Crafting enthusiast creating handmade gifts and decorations', 66, 66, 66);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Darcee Itzkowicz', 'Chemistry', 'Fadeo', 'Chicago', 'Not Interested', 'Has Car', 
    170, '6 months', 'Very Clean', 'Introverted', 5, 2, 'Chess master competing in international tournaments and championships', 67, 67, 67);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Brigg Braidley', 'Biology', 'Twimbo', 'Los Angeles', 'Complete', 'Searching for Carpool', 
    1600, '4 months', 'Very Clean', 'Introverted', 55, 1, 'Environmental advocate promoting conservation and eco-friendly practices', 68, 68, 68);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Jade Waplington', 'Finance', 'Innotype', 'Atlanta', 'Not Interested', 'Has Car', 
    2500, '4 months', 'Very Clean', 'Introverted', 30, 6, 'Environmental advocate promoting conservation and eco-friendly practices', 69, 69, 69);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Claire Mallender', 'Biology', 'Roombo', 'Chicago', 'Complete', 'Has Car', 
    1200, '6 months', 'Disorganized', 'Active', 10, 6, 'Vintage car restorer refurbishing classic vehicles to their former glory', 70, 70, 70);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Wileen Loveman', 'Biology', 'Abata', 'Atlanta', 'Searching for Housing', 
    'Complete', 3000, '4 months', 'Very Clean', 'Social', 20, 6, 'History professor researching and teaching historical events', 71, 71, 71);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Shannon Eagar', 'Chemistry', 'Skibox', 'London', 'Complete', 'Searching for Carpool', 
    1000, '1 year', 'Cluttered', 'Adventurous', 30, 2, 'Sailing captain leading sailing expeditions and charters', 72, 72, 72);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Nikita Ferronet', 'Computer Science', 'Fadeo', 'Boston', 'Complete', 'Searching for Carpool', 
    2000, '6 months', 'Clean', 'Social', 5, 1, 'Vintage car collector restoring classic automobiles', 73, 73, 73);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Quinn Corner', 'Biology', 'Meevee', 'New York City', 'Searching for Roommates', 
    'Has Car', 1800, '1 year', 'Cluttered', 'Active', 20, 1, 'Gaming streamer broadcasting gameplay and interacting with viewers', 74, 74, 74);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Hewie Speek', 'Art', 'Einti', 'Seattle', 'Not Interested', 'Complete', 
    2000, '1 year', 'Moderate', 'Adventurous', 75, 1, 'Antique dealer specializing in unique and valuable antiques', 75, 75, 75);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Ronica Maplethorp', 'Law', 'Skiba', 'D.C.', 'Searching for Roommates', 
    'Searching for Carpool', 1800, '4 months', 'Cluttered', 'Social', 10, 2, 
    'Travel blogger sharing adventures and tips with readers', 76, 76, 76);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Blair Shedden', 'Physics', 'Fanoodle', 'Seattle', 'Searching for Roommates', 
    'Searching for Carpool', 2000, '6 months', 'Disorganized', 'Extroverted', 25, 4, 
    'Tech geek experimenting with the latest gadgets and software', 77, 77, 77);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Nolly Petry', 'Law', 'Buzzster', 'Atlanta', 'Searching for Roommates', 
    'Complete', 1000, '6 months', 'Disorganized', 'Social', 55, 5, 'Fashion designer creating unique clothing and accessories', 78, 78, 78);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Flemming Gatecliffe', 'Computer Science', 'Yombu', 'New York City', 'Not Interested', 
    170, '1 year', 'Cluttered', 'Introverted', 75, 2, 'Tech entrepreneur developing innovative solutions and products', 79, 79, 79);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Prince Stickells', 'Finance', 'Dabfeed', 'Atlanta', 'Not Interested', 'Has Car', 
    2500, '4 months', 'Cluttered', 'Social', 30, 1, 'Dance choreographer creating routines for performances', 80, 80, 80);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Moselle Huddy', 'Biology', 'Kare', 'Los Angeles', 'Searching for Housing', 
    'Complete', 1350, '4 months', 'Disorganized', 'Social', 5, 2, 
    'Thrives on adrenaline with extreme sports like skydiving and bungee jumping', 81, 81, 81);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Fraser Crippill', 'Physics', 'Dynazzy', 'Los Angeles', 'Searching for Roommates', 
    'Not Interested', 1900, '1 year', 'Disorganized', 'Extroverted', 15, 2, 
    'Environmental advocate promoting conservation and eco-friendly practices', 82, 82, 82);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Jenda Wrinch', 'Psychology', 'Twinder', 'San Jose', 'Complete', 'Complete', 
    1000, '6 months', 'Very Clean', 'Outdoorsy', 35, 1, 'Gardening expert cultivating a lush and vibrant garden', 83, 83, 83);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Corliss Lavallie', 'Chemistry', 'Geba', 'Boston', 'Searching for Housing', 
    'Has Car', 2500, '6 months', 'Clean', 'Social', 55, 2, 'History buff visiting museums and historical sites', 84, 84, 84);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Ivonne Wickrath', 'Art', 'Divavu', 'London', 'Complete', 'Complete', 
    3000, '4 months', 'Moderate', 'Quiet', 75, 7, 'Keen gardener growing a variety of fruits and vegetables', 85, 85, 85);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Pearline Grumell', 'Chemistry', 'Feedfish', 'Seattle', 'Not Interested', 
    'Complete', 3000, '6 months', 'Messy', 'Social', 30, 1, 'Gamer immersing themselves in virtual worlds and online competitions', 86, 86, 86);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Susannah Raddan', 'Art', 'Tazzy', 'D.C.', 'Complete', 'Has Car', 
    1800, '4 months', 'Clean', 'Adventurous', 75, 5, 'Book publisher releasing new titles and bestsellers', 87, 87, 87);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Delila Coulbeck', 'Psychology', 'Demimbu', 'D.C.', 'Searching for Roommates', 
    'Complete', 2500, '4 months', 'Cluttered', 'Active', 45, 2, 'Wine connoisseur tasting and collecting fine wines', 88, 88, 88);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Berton Harmeston', 'Biology', 'Janyx', 'Chicago', 'Searching for Roommates', 
    'Has Car', 1000, '1 year', 'Moderate', 'Quiet', 60, 1, 'Vintage car collector restoring classic automobiles', 89, 89, 89);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Donalt Gunning', 'Finance', 'Riffpedia', 'Atlanta', 'Searching for Roommates', 
    'Not Interested', 1200, '4 months', 'Clean', 'Quiet', 30, 2, 'Astrologer providing readings and insights based on celestial movements', 90, 90, 90);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Tymon Neilus', 'Biology', 'Pixope', 'New York City', 'Complete', 'Searching for Carpool', 
    1600, '4 months', 'Cluttered', 'Quiet', 30, 7, 'Soccer coach training players on skills and strategies for the game', 91, 91, 91);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Leoine Oswell', 'Art', 'Skimia', 'Chicago', 'Complete', 'Not Interested', 
    1150, '1 year', 'Messy', 'Social', 45, 5, 'Antique enthusiast scouring flea markets for hidden treasures', 92, 92, 92);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Gerry Gatecliff', 'Finance', 'Shufflebeat', 'San Jose', 'Searching for Housing', 
    'Searching for Carpool', 1600, '1 year', 'Clean', 'Outdoorsy', 45, 6, 
    'Sports commentator providing analysis and commentary on games', 93, 93, 93);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Marissa Broun', 'Finance', 'Quire', 'Seattle', 'Searching for Housing', 
    'Complete', 3000, '1 year', 'Cluttered', 'Extroverted', 45, 1, 'Obsessed with DIY home improvement projects', 94, 94, 94);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Letty Mewton', 'Physics', 'Jabberbean', 'Atlanta', 'Complete', 
    'Searching for Carpool', 1150, '4 months', 'Moderate', 'Quiet', 45, 5, 
    'Music festival organizer planning and coordinating live music events', 95, 95, 95);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Arthur Gave', 'Business', 'Blogspan', 'San Francisco', 'Complete', 'Not Interested', 
    2500, '6 months', 'Disorganized', 'Extroverted', 40, 3, 'Fitness influencer inspiring followers with workout routines and tips', 96, 96, 96);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Joleen Satterly', 'Physics', 'Oodoo', 'Chicago', 'Searching for Housing', 
    'Searching for Carpool', 1600, '6 months', 'Moderate', 'Adventurous', 75, 4, 'Rock climbing coach training climbers on techniques and safety', 97, 97, 97);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Wheeler Martynka', 'Business', 'Rhynyx', 'London', 'Searching for Housing', 
    'Searching for Carpool', 1350, '6 months', 'Disorganized', 'Adventurous', 10, 5, 
    'Rock climbing coach training climbers on techniques and safety', 98, 98, 98);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Marys Hannaby', 'Art', 'Zazio', 'London', 'Searching for Housing', 
    'Not Interested', 170, '1 year', 'Cluttered', 'Active', 30, 6, 'Surfing enthusiast catching waves at the beach', 99, 99, 99);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, 
    Cleanliness, Lifestyle, CommuteTime, CommuteDays, Bio, CommunityID, HousingID, AdvisorID) 
values ('Ariel Gabotti', 'Biology', 'Latz', 'San Jose', 'Complete', 'Complete', 
    3000, '1 year', 'Moderate', 'Introverted', 60, 6, 'Soccer coach training players on skills and strategies for the game', 100, 100, 100);

<<<<<<< HEAD
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
insert into Events (CommunityID, Date, Name, Description) values (11, '2023-12-24', 'Alumni Networking Happy Hour', 'Group networking activities and icebreakers');
insert into Events (CommunityID, Date, Name, Description) values (12, '2024-05-26', 'Diversity in Tech Panel', 'Networking lunch with keynote speaker');
insert into Events (CommunityID, Date, Name, Description) values (13, '2024-10-24', 'Entrepreneurship Panel Series', 'Networking mixer with live music');
insert into Events (CommunityID, Date, Name, Description) values (14, '2024-04-15', 'Women in STEM Networking Event', 'Networking roundtable discussions');
insert into Events (CommunityID, Date, Name, Description) values (15, '2024-02-17', 'Professional Headshot Day', 'Professional headshot photo booth');
insert into Events (CommunityID, Date, Name, Description) values (16, '2024-07-03', 'Coding Challenge Competition', 'Networking coffee chat with mentors');
insert into Events (CommunityID, Date, Name, Description) values (17, '2024-07-02', 'Start-Up Pitch Night', 'Networking book club discussion');
insert into Events (CommunityID, Date, Name, Description) values (18, '2024-07-30', 'Career Fair Prep Workshop', 'Networking yoga session');
insert into Events (CommunityID, Date, Name, Description) values (19, '2024-04-10', 'Graduate School Info Session', 'Networking cooking class');
insert into Events (CommunityID, Date, Name, Description) values (20, '2024-01-09', 'Industry Trends Roundtable', 'Networking hike and picnic');
insert into Events (CommunityID, Date, Name, Description) values (21, '2024-09-27', 'Tech Talk Thursdays', 'Meet and greet with industry professionals');
insert into Events (CommunityID, Date, Name, Description) values (22, '2024-04-27', 'Networking Mixer Mondays', 'Interactive workshops on networking skills');
insert into Events (CommunityID, Date, Name, Description) values (23, '2024-07-12', 'Career Development Workshop', 'Panel discussion on career opportunities in tech');
insert into Events (CommunityID, Date, Name, Description) values (24, '2024-09-01', 'Industry Panel Discussions', 'Speed networking session with recruiters');
insert into Events (CommunityID, Date, Name, Description) values (25, '2024-09-23', 'Resume Building Bootcamp', 'Virtual networking happy hour');
insert into Events (CommunityID, Date, Name, Description) values (26, '2024-09-21', 'LinkedIn Profile Optimization', 'Mock interview practice with HR professionals');
insert into Events (CommunityID, Date, Name, Description) values (27, '2024-01-24', 'Mock Interview Practice', 'Resume review session with career coaches');
insert into Events (CommunityID, Date, Name, Description) values (28, '2024-01-17', 'Job Search Strategies', 'Networking bingo game with prizes');
insert into Events (CommunityID, Date, Name, Description) values (29, '2024-01-12', 'Personal Branding Workshop', 'LinkedIn profile optimization workshop');
insert into Events (CommunityID, Date, Name, Description) values (30, '2024-10-24', 'Internship Opportunities Panel', 'Networking scavenger hunt');
insert into Events (CommunityID, Date, Name, Description) values (31, '2024-08-10', 'Alumni Networking Happy Hour', 'Group networking activities and icebreakers');
insert into Events (CommunityID, Date, Name, Description) values (32, '2024-07-14', 'Diversity in Tech Panel', 'Networking lunch with keynote speaker');
insert into Events (CommunityID, Date, Name, Description) values (33, '2023-12-13', 'Entrepreneurship Panel Series', 'Networking mixer with live music');
insert into Events (CommunityID, Date, Name, Description) values (34, '2024-10-08', 'Women in STEM Networking Event', 'Networking roundtable discussions');
insert into Events (CommunityID, Date, Name, Description) values (35, '2024-01-13', 'Professional Headshot Day', 'Professional headshot photo booth');
insert into Events (CommunityID, Date, Name, Description) values (36, '2024-01-09', 'Coding Challenge Competition', 'Networking coffee chat with mentors');
insert into Events (CommunityID, Date, Name, Description) values (37, '2024-03-12', 'Start-Up Pitch Night', 'Networking book club discussion');
insert into Events (CommunityID, Date, Name, Description) values (38, '2024-10-12', 'Career Fair Prep Workshop', 'Networking yoga session');
insert into Events (CommunityID, Date, Name, Description) values (39, '2024-02-08', 'Graduate School Info Session', 'Networking cooking class');
insert into Events (CommunityID, Date, Name, Description) values (40, '2024-09-26', 'Industry Trends Roundtable', 'Networking hike and picnic');
insert into Events (CommunityID, Date, Name, Description) values (41, '2024-01-14', 'Tech Talk Thursdays', 'Meet and greet with industry professionals');
insert into Events (CommunityID, Date, Name, Description) values (42, '2024-08-12', 'Networking Mixer Mondays', 'Interactive workshops on networking skills');
insert into Events (CommunityID, Date, Name, Description) values (43, '2024-09-18', 'Career Development Workshop', 'Panel discussion on career opportunities in tech');
insert into Events (CommunityID, Date, Name, Description) values (44, '2024-08-13', 'Industry Panel Discussions', 'Speed networking session with recruiters');
insert into Events (CommunityID, Date, Name, Description) values (45, '2024-08-07', 'Resume Building Bootcamp', 'Virtual networking happy hour');
insert into Events (CommunityID, Date, Name, Description) values (46, '2024-09-06', 'LinkedIn Profile Optimization', 'Mock interview practice with HR professionals');
insert into Events (CommunityID, Date, Name, Description) values (47, '2024-10-05', 'Mock Interview Practice', 'Resume review session with career coaches');
insert into Events (CommunityID, Date, Name, Description) values (48, '2024-10-06', 'Job Search Strategies', 'Networking bingo game with prizes');
insert into Events (CommunityID, Date, Name, Description) values (49, '2024-11-24', 'Personal Branding Workshop', 'LinkedIn profile optimization workshop');
insert into Events (CommunityID, Date, Name, Description) values (50, '2024-11-08', 'Internship Opportunities Panel', 'Networking scavenger hunt');

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
=======
-- Student data
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Hodge Zelake', 'Business', 'Colgate-Palmolive', 'New York City', 'Searching for Roommates', 'Has Car', 1900, '4 months', 1, 'Cozy', 15, 5, 'Dedicated to learning about traditional crafts and artisanal techniques', 7, 7, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Melly Azema', 'Finance', 'BP', 'D.C.', 'Searching for Housing', 'Search Complete', 2100, '6 months', 1, 'Eco-friendly', 20, 4, 'Thrilled by attending music festivals and discovering new bands', 10, 7, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Pietro Mundford', 'Engineering', 'Lowe’s', 'Los Angeles', 'Searching for Housing', 'Has Car', 1200, '6 months', 4, 'Cozy', 10, 2, 'Passionate about writing poetry and expressing emotions through words', 2, 9, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Lyndell Veare', 'Engineering', 'Coca-Cola', 'Seattle', 'Searching for Roommates', 'Searching for Carpool', 2100, '1 year', 1, 'Energetic', 50, 1, 'Devoted to studying ancient mythology and folklore', 6, 2, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Malinda Lawland', 'Data Engineering', 'Johnson & Johnson', 'Boston', 'Search Complete', 'Search Complete', 2400, '6 months', 1, 'Vibrant', 30, 2, 'Obsessed with urban exploration and discovering hidden gems in cities', 3, 7, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Ellette Atteridge', 'Engineering', 'Costco', 'Chicago', 'Searching for Roommates', 'Searching for Carpool', 2100, '4 months', 4, 'Outgoing', 40, 2, 'Fascinated by the world of virtual reality and immersive experiences', 2, 7, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Eran Sailor', 'Engineering', 'Home Depot', 'Seattle', 'Searching for Housing', 'Searching for Carpool', 1500, '6 months', 1, 'Minimalist', 45, 5, 'Passionate about writing poetry and expressing emotions through words', 6, 1, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Sonja McGorley', 'Data Engineering', 'Intel', 'Seattle', 'Searching for Roommates', 'Search Complete', 2000, '1 year', 2, 'Social', 20, 4, 'Thrilled by attending music festivals and discovering new bands', 1, 2, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Alexa Beahan', 'Finance', 'Bank of America', 'D.C.', 'Searching for Housing', 'Search Complete', 1500, '4 months', 1, 'Healthy', 25, 3, 'Obsessed with urban exploration and discovering hidden gems in cities', 2, 2, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Bob Ashe', 'Marketing', 'Hyundai', 'Boston', 'Searching for Roommates', 'Searching for Carpool', 1300, '6 months', 5, 'Relaxed', 35, 3, 'Fascinated by the art of tea ceremonies and traditional rituals', 10, 5, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Moria Scottrell', 'Finance', 'Mercedes-Benz', 'San Francisco', 'Searching for Roommates', 'Searching for Carpool', 1300, '4 months', 3, 'Cozy', 70, 2, 'Passionate about painting and creating art', 3, 6, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Ediva Glenny', 'Data Science', 'Johnson & Johnson', 'D.C.', 'Searching for Roommates', 'Searching for Carpool', 1400, '6 months', 4, 'Nomadic', 50, 5, 'Thrilled by attending music festivals and discovering new bands', 5, 2, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Flory Boggon', 'Marketing', 'ExxonMobil', 'London', 'Searching for Roommates', 'Has Car', 1600, '4 months', 2, 'Eco-friendly', 70, 4, 'Dedicated to practicing yoga and meditation for inner peace', 6, 5, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Dorelle Luke', 'Data Engineering', 'Roche', 'D.C.', 'Searching for Roommates', 'Search Complete', 1900, '4 months', 1, 'Carefree', 50, 2, 'Devoted to volunteering at animal shelters', 2, 8, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Moore MacTeggart', 'Finance', 'Costco', 'London', 'Searching for Roommates', 'Has Car', 1700, '6 months', 3, 'Relaxed', 20, 4, 'Obsessed with interior design and decorating living spaces', 3, 2, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Chancey Wixey', 'Biology', 'Moderna', 'Atlanta', 'Search Complete', 'Search Complete', 1200, '1 year', 5, 'Outgoing', 70, 3, 'Dedicated to wildlife conservation and protecting endangered species', 10, 8, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Carole Wisbey', 'Art', 'Siemens Energy', 'London', 'Search Complete', 'Searching for Carpool', 2300, '4 months', 2, 'Cozy', 30, 6, 'Enjoys participating in outdoor activities like camping and hiking', 1, 7, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Bordie Buyers', 'Public Health', 'Chevron', 'New York City', 'Search Complete', 'Searching for Carpool', 1400, '6 months', 3, 'Nomadic', 60, 1, 'Thrilled by attending music festivals and discovering new bands', 5, 8, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Lisa Oxteby', 'Chemistry', 'Intel', 'Atlanta', 'Searching for Housing', 'Has Car', 2000, '4 months', 5, 'Social', 10, 5, 'Addicted to attending film festivals and discovering independent cinema', 2, 9, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Noland Buckney', 'Public Health', 'Citigroup', 'San Francisco', 'Searching for Housing', 'Searching for Carpool', 2200, '1 year', 1, 'Relaxed', 25, 5, 'Enjoys playing musical instruments and composing music', 5, 10, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Katina Fuxman', 'Chemistry', 'Boeing', 'Boston', 'Searching for Roommates', 'Search Complete', 1300, '6 months', 2, 'Active', 60, 4, 'Obsessed with urban exploration and discovering hidden gems in cities', 4, 4, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Gar Frift', 'Public Health', 'Coca-Cola', 'London', 'Searching for Roommates', 'Has Car', 1500, '1 year', 4, 'Nomadic', 30, 2, 'Thrilled by extreme weather phenomena and storm chasing', 7, 9, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Sharon Thomen', 'Public Health', 'General Motors', 'San Jose', 'Search Complete', 'Searching for Carpool', 1500, '4 months', 4, 'Holistic', 25, 5, 'Devoted to learning about different types of cuisine and cooking techniques', 6, 6, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Janenna Favelle', 'History', 'ExxonMobil', 'Los Angeles', 'Searching for Roommates', 'Searching for Carpool', 1600, '4 months', 2, 'Vibrant', 50, 5, 'Obsessed with DIY projects and home improvement', 7, 6, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Glory Klimko', 'Computer Science', 'Procter & Gamble', 'San Francisco', 'Searching for Roommates', 'Search Complete', 1300, '1 year', 1, 'Balanced', 50, 4, 'Enjoys practicing mindfulness and meditation for mental clarity', 9, 9, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Heda Muckleston', 'Public Health', 'Siemens Energy', 'Chicago', 'Searching for Housing', 'Search Complete', 1500, '6 months', 4, 'Vibrant', 50, 2, 'Addicted to attending film festivals and discovering independent cinema', 7, 8, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Bryn Littledyke', 'Finance', 'Morgan Stanley', 'New York City', 'Search Complete', 'Searching for Carpool', 2100, '1 year', 2, 'Active', 70, 2, 'Devoted to volunteering at animal shelters', 9, 5, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Augusta Dyerson', 'Data Engineering', 'BP', 'D.C.', 'Searching for Housing', 'Searching for Carpool', 1400, '4 months', 5, 'Minimalist', 10, 1, 'Devoted to volunteering at animal shelters', 4, 3, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Gardener Khidr', 'Art', 'Best Buy', 'Seattle', 'Searching for Roommates', 'Searching for Carpool', 2100, '4 months', 5, 'Vibrant', 10, 3, 'Obsessed with collecting rare vinyl records and building a music collection', 3, 4, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Gail Brende', 'Chemistry', 'General Motors', 'Boston', 'Searching for Housing', 'Has Car', 1700, '4 months', 4, 'Outgoing', 40, 6, 'Enjoys attending theater performances and musicals', 6, 5, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Ardeen Forder', 'Chemistry', 'Walmart', 'Chicago', 'Searching for Housing', 'Has Car', 1900, '1 year', 3, 'Vibrant', 20, 2, 'Thrilled by attending comic conventions and cosplay events', 3, 6, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Darb Borgnol', 'History', 'Intel', 'Los Angeles', 'Searching for Housing', 'Searching for Carpool', 1100, '4 months', 5, 'Social', 45, 4, 'Passionate about photography and capturing beautiful moments', 2, 5, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Sadye Ashbrook', 'Computer Science', 'Johnson & Johnson', 'San Jose', 'Searching for Roommates', 'Has Car', 1500, '4 months', 1, 'Outgoing', 10, 4, 'Passionate about cooking and trying new recipes', 4, 5, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Verena Fost', 'Data Engineering', 'PepsiCo', 'D.C.', 'Search Complete', 'Has Car', 1100, '6 months', 2, 'Outgoing', 45, 3, 'Devoted to watching and analyzing classic movies', 7, 9, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Matilda Giovannini', 'Computer Science', 'Walt Disney Company', 'Los Angeles', 'Searching for Roommates', 'Searching for Carpool', 2000, '4 months', 2, 'Outgoing', 50, 2, 'Passionate about exploring abandoned buildings and urban decay', 3, 5, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Standford Bertolaccini', 'Finance', 'Honda', 'Los Angeles', 'Searching for Roommates', 'Searching for Carpool', 1600, '4 months', 2, 'Carefree', 35, 1, 'Devoted to studying ancient mythology and folklore', 3, 9, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Dianne Orae', 'Data Science', 'Bank of America', 'Los Angeles', 'Search Complete', 'Search Complete', 1300, '1 year', 2, 'Social', 30, 1, 'Addicted to reading mystery novels and solving puzzles', 9, 1, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Nadya Wellesley', 'History', 'Netflix', 'Seattle', 'Search Complete', 'Has Car', 1600, '4 months', 5, 'Healthy', 70, 2, 'Devoted to studying psychology and understanding human behavior', 10, 3, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Darcie Weems', 'Data Science', 'Moderna', 'Los Angeles', 'Search Complete', 'Searching for Carpool', 2300, '6 months', 4, 'Nomadic', 10, 1, 'Fascinated by the world of virtual reality and immersive experiences', 4, 10, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Vinnie Tresvina', 'Chemistry', 'Google (Alphabet Inc.)', 'Boston', 'Search Complete', 'Search Complete', 1900, '1 year', 4, 'Outgoing', 20, 3, 'Dedicated to learning about traditional crafts and artisanal techniques', 5, 9, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Elvira Westhoff', 'Marketing', 'Johnson & Johnson', 'San Jose', 'Searching for Roommates', 'Has Car', 1700, '4 months', 2, 'Cozy', 50, 2, 'Thrilled by extreme weather phenomena and storm chasing', 4, 9, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Fletch Hicken', 'Biology', 'Toyota', 'Seattle', 'Searching for Roommates', 'Has Car', 1500, '4 months', 5, 'Vibrant', 60, 1, 'Fascinated by astronomy and stargazing', 6, 2, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Beatriz Braksper', 'Engineering', 'Hyundai', 'Los Angeles', 'Searching for Housing', 'Search Complete', 1300, '6 months', 2, 'Holistic', 50, 3, 'Devoted to learning about different types of cuisine and cooking techniques', 8, 1, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Ronda Ten Broek', 'Business', 'Coca-Cola', 'San Jose', 'Search Complete', 'Searching for Carpool', 1300, '4 months', 5, 'Social', 40, 3, 'Thrilled by extreme sports like snowboarding and mountain biking', 5, 10, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Fabien Arger', 'Art', 'Roche', 'Chicago', 'Searching for Roommates', 'Has Car', 1800, '1 year', 5, 'Energetic', 30, 3, 'Thrilled by extreme sports like skydiving and bungee jumping', 5, 1, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Stormie Beadel', 'Computer Science', 'Lowe’s', 'Los Angeles', 'Search Complete', 'Searching for Carpool', 1600, '6 months', 3, 'Balanced', 15, 3, 'Passionate about collecting rare books and first editions', 3, 3, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Carolina Goldbourn', 'Data Science', 'Intel', 'London', 'Searching for Housing', 'Searching for Carpool', 2400, '4 months', 2, 'Active', 15, 3, 'Enjoys attending theater performances and musicals', 5, 5, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Isac Veart', 'Data Engineering', 'Northrop Grumman', 'D.C.', 'Search Complete', 'Search Complete', 2100, '4 months', 4, 'Cozy', 25, 5, 'Fascinated by the world of competitive gaming and esports tournaments', 4, 8, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Bayard Quidenham', 'Art', 'PepsiCo', 'D.C.', 'Searching for Housing', 'Searching for Carpool', 1100, '4 months', 5, 'Vibrant', 60, 4, 'Passionate about sustainable fashion and ethical clothing brands', 4, 4, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Herbie Rain', 'Finance', 'Citigroup', 'San Francisco', 'Searching for Roommates', 'Search Complete', 2000, '6 months', 2, 'Carefree', 70, 3, 'Enjoys gardening and growing own fruits and vegetables', 6, 6, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Lula Fulstow', 'Chemistry', 'Citigroup', 'Chicago', 'Searching for Roommates', 'Search Complete', 1300, '1 year', 1, 'Carefree', 30, 1, 'Addicted to exploring abandoned places and urban exploration', 7, 3, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Mildred Sandwich', 'Computer Science', 'Wells Fargo', 'Chicago', 'Search Complete', 'Has Car', 1400, '1 year', 1, 'Social', 45, 3, 'Intrigued by the world of professional gaming and esports competitions', 9, 10, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Marcello Barlass', 'Computer Science', 'Mercedes-Benz', 'San Jose', 'Searching for Housing', 'Has Car', 1400, '1 year', 1, 'Healthy', 30, 5, 'Intrigued by the art of bonsai cultivation and creating miniature landscapes', 8, 9, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Raye McGuff', 'History', 'Siemens Energy', 'Seattle', 'Search Complete', 'Searching for Carpool', 1900, '1 year', 3, 'Outgoing', 45, 1, 'Enjoys practicing mindfulness and meditation for mental clarity', 2, 3, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Alida Hallad', 'Chemistry', 'Honda', 'San Francisco', 'Searching for Housing', 'Has Car', 2200, '4 months', 3, 'Minimalist', 45, 2, 'Fascinated by marine biology and scuba diving', 2, 2, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Cati Girauld', 'Engineering', 'Boeing', 'Los Angeles', 'Searching for Roommates', 'Search Complete', 1200, '1 year', 5, 'Eco-friendly', 60, 5, 'Addicted to vintage shopping and finding unique retro treasures', 5, 5, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Forrester Keller', 'Marketing', 'Chevron', 'San Jose', 'Search Complete', 'Searching for Carpool', 1400, '6 months', 5, 'Eco-friendly', 30, 2, 'Dedicated to studying ancient civilizations and archaeological discoveries', 10, 8, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Smitty Emmitt', 'Data Engineering', 'Morgan Stanley', 'London', 'Searching for Housing', 'Searching for Carpool', 2200, '4 months', 4, 'Relaxed', 45, 5, 'Passionate about attending art exhibitions and supporting local artists', 1, 8, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Neddie Castagne', 'Data Engineering', 'Goldman Sachs', 'London', 'Searching for Housing', 'Has Car', 1700, '6 months', 4, 'Nomadic', 20, 6, 'Intrigued by the art of mixology and creating signature cocktails', 10, 7, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Fiann Gavan', 'Chemistry', 'Novartis', 'San Francisco', 'Searching for Roommates', 'Has Car', 2300, '6 months', 5, 'Vibrant', 20, 3, 'Devoted to volunteering at animal shelters', 2, 9, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Roxi Beefon', 'Computer Science', 'Citigroup', 'New York City', 'Searching for Roommates', 'Has Car', 2400, '6 months', 2, 'Eco-friendly', 25, 3, 'Enjoys participating in outdoor activities like camping and hiking', 3, 10, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Brandi Mickleborough', 'Engineering', 'Best Buy', 'Los Angeles', 'Search Complete', 'Searching for Carpool', 2100, '4 months', 1, 'Minimalist', 70, 3, 'Passionate about cooking and trying new recipes', 8, 6, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Nappie Yerrill', 'Marketing', 'Walmart', 'New York City', 'Searching for Roommates', 'Has Car', 2000, '6 months', 1, 'Outgoing', 70, 4, 'Enjoys playing musical instruments and composing music', 7, 2, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Pavlov Flag', 'Data Science', 'Amazon', 'Seattle', 'Search Complete', 'Searching for Carpool', 1200, '6 months', 2, 'Energetic', 70, 5, 'Intrigued by the art of mixology and creating signature cocktails', 6, 8, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Yolande Tale', 'Finance', 'Siemens Energy', 'Seattle', 'Search Complete', 'Search Complete', 2200, '4 months', 1, 'Social', 10, 6, 'Dedicated to studying ancient civilizations and archaeological discoveries', 7, 8, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Rubetta Neale', 'Public Health', 'Lowe’s', 'Atlanta', 'Searching for Housing', 'Searching for Carpool', 1400, '6 months', 5, 'Balanced', 15, 2, 'Fascinated by the world of virtual reality and immersive experiences', 6, 9, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Amara McGerr', 'Marketing', 'PepsiCo', 'New York City', 'Searching for Roommates', 'Search Complete', 2000, '6 months', 3, 'Balanced', 15, 4, 'Thrilled by attending comic conventions and cosplay events', 2, 10, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Maxie Cowely', 'Finance', 'Moderna', 'Atlanta', 'Searching for Housing', 'Search Complete', 2200, '1 year', 2, 'Energetic', 50, 3, 'Devoted to studying philosophy and exploring existential questions', 1, 8, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Gabby Dearl', 'Biology', 'Lockheed Martin', 'D.C.', 'Searching for Roommates', 'Searching for Carpool', 2300, '6 months', 5, 'Minimalist', 10, 1, 'Addicted to attending film festivals and discovering independent cinema', 6, 6, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Heddi Barstock', 'Engineering', 'Morgan Stanley', 'Boston', 'Searching for Roommates', 'Has Car', 1100, '1 year', 1, 'Vibrant', 30, 1, 'Passionate about writing poetry and expressing emotions through words', 2, 5, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Seth Moukes', 'Data Engineering', 'JPMorgan Chase', 'Boston', 'Searching for Roommates', 'Search Complete', 1500, '6 months', 4, 'Balanced', 40, 1, 'Fascinated by astronomy and stargazing', 3, 7, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Lydon Soldi', 'Business', 'Siemens Energy', 'Boston', 'Searching for Housing', 'Search Complete', 2400, '1 year', 2, 'Balanced', 35, 4, 'Loves hiking and exploring nature trails', 1, 6, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Rufus Chiplin', 'Biology', 'Chevron', 'Los Angeles', 'Searching for Housing', 'Searching for Carpool', 2400, '6 months', 4, 'Vibrant', 70, 6, 'Thrilled by extreme sports like snowboarding and mountain biking', 4, 8, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Zelda Hengoed', 'Finance', 'Pfizer', 'Chicago', 'Searching for Roommates', 'Search Complete', 2400, '6 months', 4, 'Relaxed', 35, 3, 'Thrilled by attending comic conventions and cosplay events', 2, 8, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Alissa Shurey', 'Finance', 'Lockheed Martin', 'San Francisco', 'Searching for Roommates', 'Searching for Carpool', 1400, '4 months', 3, 'Minimalist', 25, 4, 'Dedicated to learning about sustainable agriculture and organic farming', 4, 5, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Brod Skamell', 'Computer Science', 'Meta (Facebook)', 'Chicago', 'Search Complete', 'Searching for Carpool', 1500, '1 year', 1, 'Healthy', 40, 5, 'Enjoys playing musical instruments and composing music', 7, 3, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Melisenda Skehan', 'Data Engineering', 'Wells Fargo', 'London', 'Searching for Roommates', 'Search Complete', 2100, '6 months', 4, 'Nomadic', 20, 4, 'Passionate about attending art exhibitions and supporting local artists', 7, 2, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Ravi Kilgrove', 'Art', 'Hyundai', 'Chicago', 'Searching for Housing', 'Searching for Carpool', 1600, '4 months', 1, 'Sustainable', 40, 1, 'Intrigued by the art of storytelling and creating compelling narratives', 6, 2, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Dav Birtwhistle', 'Art', 'Boeing', 'Atlanta', 'Searching for Roommates', 'Search Complete', 1500, '6 months', 1, 'Balanced', 30, 6, 'Dedicated to learning martial arts and self-defense techniques', 2, 1, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Ambur Harmour', 'Finance', 'Honda', 'San Jose', 'Search Complete', 'Has Car', 2000, '6 months', 3, 'Cozy', 10, 3, 'Intrigued by the art of storytelling and creating compelling narratives', 10, 5, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Cyndy Eckersall', 'Marketing', 'Northrop Grumman', 'London', 'Searching for Housing', 'Has Car', 2400, '1 year', 2, 'Holistic', 15, 6, 'Obsessed with collecting rare vinyl records and building a music collection', 10, 8, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Lia Veillard', 'Finance', 'NBCUniversal', 'Chicago', 'Search Complete', 'Has Car', 2400, '1 year', 4, 'Minimalist', 50, 5, 'Passionate about attending art exhibitions and supporting local artists', 10, 9, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Gustave Toffoloni', 'Data Engineering', 'Best Buy', 'Seattle', 'Search Complete', 'Searching for Carpool', 1200, '4 months', 3, 'Minimalist', 20, 2, 'Passionate about painting and creating art', 6, 5, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Stace Semble', 'Biology', 'Citigroup', 'San Francisco', 'Searching for Housing', 'Searching for Carpool', 1900, '6 months', 4, 'Cozy', 60, 6, 'Fascinated by the world of magic and illusion', 9, 1, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('April Djurevic', 'Data Engineering', 'BP', 'Chicago', 'Searching for Roommates', 'Searching for Carpool', 2100, '6 months', 1, 'Relaxed', 60, 3, 'Devoted to studying ancient mythology and folklore', 2, 6, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Kora Parradye', 'History', 'Northrop Grumman', 'Atlanta', 'Search Complete', 'Searching for Carpool', 1100, '1 year', 4, 'Active', 30, 3, 'Addicted to attending science fiction conventions and meeting favorite authors', 8, 2, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Bridget Dartnell', 'Computer Science', 'General Motors', 'Los Angeles', 'Searching for Roommates', 'Has Car', 1900, '4 months', 1, 'Energetic', 40, 2, 'Obsessed with urban exploration and discovering hidden gems in cities', 7, 8, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Phelia Nother', 'Finance', 'Johnson & Johnson', 'London', 'Searching for Roommates', 'Search Complete', 1500, '6 months', 4, 'Energetic', 25, 4, 'Addicted to attending film festivals and discovering independent cinema', 8, 7, 4);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Camila Gronauer', 'Finance', 'Tesla', 'Seattle', 'Searching for Roommates', 'Searching for Carpool', 2400, '4 months', 4, 'Healthy', 35, 1, 'Obsessed with collecting rare vinyl records and building a music collection', 10, 4, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Teador Capron', 'History', 'Unilever', 'Atlanta', 'Search Complete', 'Has Car', 2200, '6 months', 5, 'Relaxed', 60, 5, 'Devoted to studying psychology and understanding human behavior', 10, 9, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Husein Despenser', 'Data Science', 'Meta (Facebook)', 'Atlanta', 'Searching for Roommates', 'Has Car', 1200, '1 year', 4, 'Relaxed', 45, 3, 'Fascinated by the art of tea ceremonies and traditional rituals', 3, 6, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Carmen Rollett', 'History', 'Ford', 'London', 'Searching for Roommates', 'Search Complete', 1400, '1 year', 1, 'Nomadic', 20, 3, 'Dedicated to learning about sustainable agriculture and organic farming', 2, 2, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Nana Richings', 'Data Science', 'Pfizer', 'Boston', 'Searching for Housing', 'Search Complete', 1000, '4 months', 1, 'Eco-friendly', 40, 1, 'Addicted to collecting rare coins and currency from around the world', 1, 7, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Rafaelita Hodge', 'Public Health', 'Costco', 'San Jose', 'Search Complete', 'Has Car', 1900, '6 months', 4, 'Relaxed', 70, 5, 'Passionate about exploring abandoned buildings and urban decay', 3, 7, 1);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Alfonse Tuttle', 'Finance', 'Boeing', 'D.C.', 'Searching for Roommates', 'Searching for Carpool', 1500, '1 year', 3, 'Social', 50, 2, 'Fascinated by the world of virtual reality and immersive experiences', 2, 8, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Fran Cuss', 'Data Science', 'Meta (Facebook)', 'San Jose', 'Searching for Housing', 'Searching for Carpool', 1300, '1 year', 4, 'Nomadic', 20, 4, 'Passionate about attending art exhibitions and supporting local artists', 9, 5, 5);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Alvy Garley', 'Public Health', 'Honda', 'New York City', 'Search Complete', 'Searching for Carpool', 1100, '4 months', 2, 'Social', 60, 3, 'Passionate about collecting rare books and first editions', 6, 5, 2);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Marcela Rutherfoord', 'History', 'Pfizer', 'Chicago', 'Searching for Roommates', 'Searching for Carpool', 2200, '6 months', 4, 'Sustainable', 15, 3, 'Devoted to studying philosophy and exploring existential questions', 8, 6, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Marji Towell', 'Art', 'Johnson & Johnson', 'Seattle', 'Searching for Housing', 'Search Complete', 1900, '4 months', 4, 'Balanced', 35, 5, 'Fascinated by astronomy and stargazing', 1, 1, 3);
insert into Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus, Budget, LeaseDuration, Cleanliness, Lifestyle, CommuteTime, CommuteDays, Biography, CommunityID, AdvisorID, Reminder) values ('Jillie Leivesley', 'Data Engineering', 'Best Buy', 'Boston', 'Search Complete', 'Has Car', 2200, '4 months', 4, 'Active', 40, 4, 'Devoted to learning about different types of cuisine and cooking techniques', 6, 7, 3);
>>>>>>> 1015f19c53beee0323c5bf3c4c88d11f0d8c22db

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
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (31, 'formatting problem', 'cancelled', 'High', '2024-11-02', '2024-02-13');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (32, 'incorrect password', 'cancelled', 'Medium', '2024-05-02', '2024-01-02');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (33, 'missing images', 'completed', 'Low', '2024-03-28', '2024-03-10');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (34, 'slow performance', 'completed', 'High', '2024-07-04', '2024-03-22');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (35, 'formatting problem', 'completed', 'Medium', '2024-03-20', '2024-06-02');
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (36, 'Data backup request', '2024-01-01 14:19:33', 9, 35);
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (37, 'Data backup request', '2024-01-22 02:11:10', 14, 94);
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (38, 'Virus detected on device', '2024-04-21 20:32:07', 22, 36);
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (39, 'Need help setting up new device', '2023-12-14 19:54:52', 1, 37);
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (40, 'Need help with troubleshooting', '2024-05-23 17:51:25', 30, 65);
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (41, 'Account locked', '2024-11-23 02:47:21', 8, 92);
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (42, 'Issue with login credentials', '2024-10-22 06:51:05', 20, 80);
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (43, 'Need help setting up new device', '2024-07-11 14:32:57', 11, 85);
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (44, 'Email not sending', '2024-11-02 23:03:10', 25, 22);
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (45, 'Device not turning on', '2024-11-11 06:37:15', 7, 49);
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (46, 'Error message on screen', '2024-04-01 19:44:01', 15, 15);
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (47, 'Account locked', '2023-12-05 15:00:08', 29, 70);
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (48, 'Software update needed', '2024-08-22 03:59:14', 4, 87);
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (49, 'Device not turning on', '2024-03-26 07:03:27', 19, 82);
insert into Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate) values (50, 'Virus detected on device', '2024-03-01 14:51:56', 10, 2);

-- 10. SystemLog Data (depends on Ticket)
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values (1, '2024-01-01 12:00:00', 'System startup', 'Performance', 'Protected', 'Secure');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Khoury College', '2024-03-27 09:10:45', 'User logged in', 'CPU Usage', 'Data Minimization Compliance', 'Intrusion Detection Alerts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Engineering', '2024-08-18 13:56:45', 'User viewed dashboard', 'System Load', 'Data Retention Policy Compliance', 'Authentication Failures');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('D''Amore Mc-Kim', '2024-04-02 21:27:13', 'User updated profile', 'System Uptime', 'Data Retention Policy Compliance', 'Encryption Key Rotation');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Science', '2024-09-07 19:30:18', 'User logged out', 'Incident Resolution Time', 'Data Sharing Permissions', 'Access Control Compliance');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Bouve College', '2024-05-23 17:18:14', 'User logged out', 'Error Rate', 'Data Anonymization Compliance', 'Access Control Compliance');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Science', '2023-12-06 17:34:34', 'User logged out', 'System Uptime', 'User Consent Management', 'Two-Factor Authentication (2FA) Usage');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Khoury College', '2024-05-02 19:55:05', 'User logged out', 'Network Latency', 'Sensitive Data Exposure', 'Two-Factor Authentication (2FA) Usage');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Engineering', '2024-10-19 13:04:17', 'User logged out', 'Patch Management', 'Data Collection Transparency', 'Firewall Activity');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('D''Amore Mc-Kim', '2024-07-07 11:36:15', 'User logged in', 'Error Rate', 'Data Retention Policy Compliance', 'Unauthorized Access Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Science', '2024-04-22 10:57:34', 'User logged in', 'Error Rate', 'Data Access Audits', 'Unauthorized Access Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Bouve College', '2024-08-12 00:43:26', 'User made a purchase', 'System Load', 'Data Minimization Compliance', 'Phishing Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Science', '2024-05-27 19:41:32', 'User viewed dashboard', 'Error Rate', 'Sensitive Data Exposure', 'Authentication Failures');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Khoury College', '2024-09-18 01:52:11', 'User viewed dashboard', 'Service Downtime', 'Data Anonymization Compliance', 'Security Vulnerability Scans');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Engineering', '2024-03-20 22:24:55', 'User logged in', 'Backup Success Rate', 'Data Collection Transparency', 'Audit Log Entries');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('D''Amore Mc-Kim', '2024-05-08 00:23:35', 'User logged in', 'Compliance Rate', 'User Data Access Requests', 'Unauthorized Access Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Science', '2023-12-15 15:12:20', 'User updated profile', 'Database Backup Frequency', 'Data Minimization Compliance', 'Phishing Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Bouve College', '2024-09-09 22:04:23', 'User searched for products', 'Data Throughput', 'Sensitive Data Exposure', 'Phishing Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Science', '2024-10-29 16:55:37', 'User searched for products', 'System Scalability', 'Data Retention Policy Compliance', 'Audit Log Entries');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Khoury College', '2024-08-24 17:11:28', 'User logged in', 'System Scalability', 'Data Anonymization Compliance', 'Audit Log Entries');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Engineering', '2024-05-30 22:40:11', 'User searched for products', 'Memory Usage', 'Sensitive Data Exposure', 'Phishing Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('D''Amore Mc-Kim', '2024-10-08 14:54:43', 'User logged in', 'Database Query Time', 'Data Anonymization Compliance', 'Phishing Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Science', '2023-12-11 09:22:34', 'User added item to cart', 'User Login Attempts', 'Data Sharing Permissions', 'Unauthorized Access Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Bouve College', '2024-01-07 12:43:32', 'User requested password reset', 'Disk Space', 'User Data Access Requests', 'Security Patch Compliance');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Science', '2024-07-04 01:21:21', 'User added item to cart', 'Response Time', 'Data Sharing Permissions', 'Unauthorized Access Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Khoury College', '2024-01-31 02:41:53', 'User updated profile', 'Security Events', 'Privacy Policy Compliance', 'Password Strength Compliance');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Engineering', '2024-03-25 08:42:17', 'User logged out', 'Error Rate', 'Privacy Policy Compliance', 'Unauthorized Access Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('D''Amore Mc-Kim', '2024-10-16 00:54:25', 'User added item to cart', 'User Login Attempts', 'Privacy Policy Compliance', 'Password Strength Compliance');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Science', '2024-02-14 15:58:24', 'User updated profile', 'Error Rate', 'Data Collection Transparency', 'Password Strength Compliance');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Bouve College', '2024-10-05 12:35:21', 'User made a purchase', 'User Login Attempts', 'Data Anonymization Compliance', 'Access Requests');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Science', '2024-01-15 10:46:13', 'User logged out', 'System Scalability', 'Data Collection Transparency', 'Security Breach Incidents');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Khoury College', '2024-03-08 04:42:51', 'User logged in', 'Patch Management', 'Data Access Audits', 'Access Requests');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Engineering', '2024-08-23 02:36:45', 'User made a purchase', 'User Login Attempts', 'Data Access Audits', 'Audit Log Entries');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('D''Amore Mc-Kim', '2024-01-14 22:57:14', 'User made a purchase', 'System Uptime', 'Data Retention Policy Compliance', 'Security Patch Compliance');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Science', '2024-07-08 23:42:30', 'User logged out', 'Database Backup Frequency', 'Sensitive Data Exposure', 'Data Encryption Status');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Bouve College', '2024-08-03 00:09:08', 'User added item to cart', 'System Uptime', 'Privacy Policy Compliance', 'Phishing Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Science', '2024-04-08 14:22:41', 'User changed password', 'Response Time', 'Data Minimization Compliance', 'Data Encryption Status');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Khoury College', '2024-10-26 13:44:57', 'User made a purchase', 'Incident Resolution Time', 'User Data Access Requests', 'Data Encryption Status');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Engineering', '2024-01-31 01:47:53', 'User added item to cart', 'Compliance Rate', 'Sensitive Data Exposure', 'Encryption Key Rotation');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('D''Amore Mc-Kim', '2024-04-10 15:29:05', 'User searched for products', 'Database Backup Frequency', 'Data Retention Policy Compliance', 'Access Control Compliance');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Science', '2024-06-16 23:55:27', 'User logged in', 'CPU Usage', 'Data Sharing Permissions', 'Phishing Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Bouve College', '2024-01-30 08:58:05', 'User logged out', 'Service Downtime', 'Data Access Audits', 'Encryption Key Rotation');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Science', '2024-06-09 19:10:09', 'User requested password reset', 'Memory Usage', 'Data Retention Policy Compliance', 'Phishing Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Khoury College', '2024-03-31 06:09:19', 'User logged out', 'Network Latency', 'Privacy Policy Compliance', 'Encryption Key Rotation');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Engineering', '2024-08-15 23:14:31', 'User searched for products', 'Compliance Rate', 'User Data Access Requests', 'Phishing Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('D''Amore Mc-Kim', '2024-05-06 17:10:56', 'User added item to cart', 'Disk Space', 'Data Retention Policy Compliance', 'Password Strength Compliance');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Science', '2024-02-04 01:54:22', 'User made a purchase', 'Response Time', 'User Data Access Requests', 'Unauthorized Access Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Bouve College', '2024-11-28 21:06:43', 'User logged in', 'Security Events', 'Data Anonymization Compliance', 'Security Patch Compliance');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Science', '2024-06-15 13:53:17', 'User logged in', 'Database Backup Frequency', 'Data Retention Policy Compliance', 'Phishing Attempts');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('Khoury College', '2024-03-19 04:19:05', 'User added item to cart', 'System Load', 'Privacy Policy Compliance', 'Data Encryption Status');
insert into SystemLog (TicketID, Timestamp, Activity, MetricType, Privacy, Security) values ('College of Engineering', '2024-01-28 09:04:12', 'User changed password', 'Active Connections', 'Sensitive Data Exposure', 'Firewall Activity');

-- 11. SystemHealth Data (depends on SystemLog)
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (1, '2024-01-01 12:00:00', 'Normal', 'System Performance');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (12, '2023-12-08 03:13:57', 'Normal', 'Security Events');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (34, '2023-12-02 23:34:00', 'Active', 'Network Latency');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (7, '2024-06-20 11:47:06', 'Operational', 'Service Downtime');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (23, '2024-02-26 08:05:29', 'Recovered', 'Data Throughput');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (45, '2024-06-29 11:52:55', 'Operational', 'Backup Success Rate');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (18, '2024-05-21 12:15:08', 'Operational', 'Incident Resolution Time');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (31, '2023-12-20 16:19:30', 'Recovered', 'Service Downtime');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (9, '2023-12-25 09:35:03', 'Normal', 'Database Backup Frequency');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (27, '2024-01-11 21:42:14', 'Complete', 'System Uptime');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (50, '2024-06-08 16:58:41', 'Recovered', 'Service Downtime');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (14, '2024-10-25 20:48:26', 'Complete', 'Disk Space');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (39, '2024-05-14 09:39:44', 'Recovered', 'System Uptime');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (5, '2024-06-24 02:45:26', 'Active', 'User Login Attempts');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (20, '2024-07-24 13:11:47', 'Normal', 'System Scalability');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (42, '2024-07-17 13:01:47', 'Complete', 'Error Rate');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (3, '2024-11-05 13:29:34', 'Recovered', 'CPU Usage');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (36, '2024-03-25 07:56:21', 'Operational', 'Service Downtime');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (10, '2024-03-22 07:01:50', 'Complete', 'Response Time');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (25, '2024-05-16 19:39:19', 'Complete', 'Data Throughput');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (48, '2024-11-05 10:44:02', 'Complete', 'Patch Management');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (16, '2024-05-01 15:17:33', 'Normal', 'CPU Usage');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (41, '2024-03-21 17:26:03', 'Normal', 'Security Events');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (8, '2024-04-09 02:34:09', 'Recovered', 'User Login Attempts');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (30, '2024-11-21 15:10:52', 'Active', 'System Scalability');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (47, '2024-11-20 22:30:35', 'Active', 'Backup Success Rate');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (13, '2024-08-31 10:17:14', 'Recovered', 'Network Latency');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (38, '2024-03-10 16:47:48', 'Normal', 'System Uptime');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (6, '2024-11-18 07:29:51', 'Active', 'Network Latency');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (21, '2024-08-23 20:03:42', 'Operational', 'Data Throughput');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (44, '2024-10-22 18:03:39', 'Operational', 'Disk Space');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (2, '2024-06-10 10:19:24', 'Active', 'Data Throughput');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (35, '2024-09-24 13:11:15', 'Recovered', 'User Login Attempts');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (11, '2024-10-30 09:38:08', 'Operational', 'Database Backup Frequency');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (26, '2024-05-20 00:54:29', 'Recovered', 'Network Latency');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (49, '2024-11-09 18:50:06', 'Active', 'Database Backup Frequency');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (15, '2024-07-25 12:48:28', 'Normal', 'Disk Space');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (40, '2023-12-31 12:28:57', 'Recovered', 'Error Rate');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (4, '2024-02-01 03:15:07', 'Operational', 'Active Connections');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (19, '2024-08-18 07:34:13', 'Recovered', 'System Uptime');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (43, '2024-11-11 05:01:35', 'Normal', 'System Load');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (1, '2023-12-10 23:28:13', 'Active', 'Response Time');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (37, '2024-05-17 12:57:33', 'Complete', 'Disk Space');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (24, '2024-08-05 23:12:30', 'Normal', 'Database Query Time');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (46, '2024-03-07 08:42:21', 'Active', 'Database Backup Frequency');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (17, '2024-05-06 10:13:32', 'Normal', 'Patch Management');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (32, '2024-09-22 01:10:12', 'Complete', 'CPU Usage');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (22, '2024-01-30 03:51:19', 'Normal', 'Data Throughput');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (33, '2024-06-11 12:00:15', 'Operational', 'Disk Space');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (28, '2024-05-26 08:55:01', 'Complete', 'Patch Management');
insert into SystemHealth (LogID, Timestamp, Status, MetricType) values (29, '2024-11-28 04:45:43', 'Operational', 'User Login Attempts');

