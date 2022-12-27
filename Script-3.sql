create table if not exists artists(
			id SERIAL primary key,
			name VARCHAR (60) unique not null,
			genre VARCHAR (60) references genre(name)
);

create table if not exists album(
			id SERIAL primary key ,
			artists_id integer not null references artists(id),
			name VARCHAR (60)  not null,
			year integer 
);	


create table if not exists genre (
			id SERIAL primary key,
			artists_id integer not null references artists(id),
			name VARCHAR (60) unique not NULL
);


create table if not exists artists_genre (
			artists_id integer references artists(id),
			genre_id integer references genre(id),
			constraint key1 primary key(artists_id, genre_id )
);

create table if not exists artists_album (
			artists_id integer references artists(id),
			album_id integer references album(id),
			constraint key2 primary key(artists_id, album_id )
);

create table if not exists track(
			id SERIAL primary key,
			album_id integer not null references album(id),
			name VARCHAR (60) not null,
			duration integer 
);


create table if not exists collection (
			id SERIAL primary key,
			artists_id integer not null references  track(id),
			name VARCHAR (60)  not null,
			year integer 
			
);	

create table if not exists track_collection (
			track_id integer references track(id),
			collection_id integer references collection(id),
			constraint key3 primary key(track_id, collection_id )
);

