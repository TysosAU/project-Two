CREATE DATABASE projectDB;
GO

USE projectDB;
GO

CREATE TABLE ChatbotData (
    ID INT IDENTITY(1,1) PRIMARY KEY, 
    UserInput NVARCHAR(MAX) NOT NULL, 
    Response NVARCHAR(MAX) NOT NULL   
);
GO

INSERT INTO ChatbotData (UserInput, Response)
VALUES 
	('hello','Hello!'),
    ('Asynchronous Programming', 'Asynchronous programming helps allow a program to perform tasks without having to wait for others to finish beforehand.'),
    ('Data Structures', 'Data Structures include ways to store and/or organize data to enable efficient access and/or modification of data. A few data structures include Arrays, Lists, Dictionaries, Stacks, and Queues.'),
    ('Array', 'An Array includes a fixed-size collection of elements of the same type. For example: {1, 2, 3, 99, 50}, {yes, no, ok, yeah}, etc.'), 
    ('Explain in relation to databases modelling rules, include three naming conventions.',
     '1. Entities. This includes real-world objects or concepts in a database. When naming entities, they should be clear and descriptive like singular nouns and avoid abbreviations. An example of them being clear and descriptive includes a table representing employees being named Employee, rather than Emp.' +
     ' 2. Attributes. This includes the properties and/or characteristics of entities. Clear and concise naming of attributes helps in understanding the data model in relation to the attributes and it is recommended that ambiguous names should be avoided when naming attributes, instead being descriptive terms. An example of clear and concise naming of attributes includes instead of Attr1 and/or FieldA, use names like FirstName or DateOfBirth.' +
     ' 3. Relationships: Relationships define how entities are related to each other. When naming them, indicate the nature of the association between entities.'),
    ('What is a logical design concept?','A logical design concept includes designing the structure and organization of data without considering the physical implementation details.'),
	('what is first normal form?','First Normal Form (1NF) includes ensuring that each column in a table contains atomic values, eliminating repeating groups.'),
	('what is second normal form?','Second Normal Form (2NF) Requires 1NF and ensures that each non-key attribute is fully functionally dependent on the primary key.'),
	('what is third normal form?','Third Normal Form (3NF) Requires 2NF and eliminates transitive dependencies, ensuring that non-key attributes depend only on the primary key.'),
	('Describe some basic principles of Database Managment Systems','Some Basic Principles of Database-Management Systems include 1. Data Integrity, This includes the accuracy and consistency of data. 2. Data Security, This includes protecting data from unauthorized access. 3. Data Independence, This includes Separating data from application logic. 4. Concurrency Control, This includes managing simultaneous data access by multiple users.'),
	('Describe some basic principles of Object-Oriented Programming.','Some Basic Principles of Object-Oriented Programming include 1. Encapsulation, This includes bundling data and methods within objects. 2. Inheritance, This includes a Mechanism to create new classes from existing ones. 3. Polymorphism, This includes the ability of a single function and/or method to work in different ways based on the object it is acting upon. 4. Abstraction, This includes Simplifying Complex systems by modeling classes that are necessary for the system.'),
	('Descibe some basic principles of Open-Source Development Tools.','Basic Principles of Open-Source Development Tools include 1. Transparency, This includes the Source code being open for inspection. 2. Collaboration, This includes Encouraging contributions from developers.'),
	('Describe some basic principles of the Software Development Life Cycle.', 'Some Basic Principles of the Software Development Life Cycle (SDLC) include 1. Planning, This includes defining goals and the scope of a system. 2. Analysis, This includes gathering and analyzing requirements. 3. Design, This includes Creating the design specifications of the system. 4. Implementation, This includes Coding and integrating the components in the system. 5. Testing, This includes verifying and validating the functions of the system. 6. Deployment, This includes releasing the system to users. 7. Maintenance, This includes fixing any errors that may appear in the system and improving the system.'),
	('Give a basic explanation of the process of developing small-sized applications.','A basic explanation of the process of developing small-sized applications includes  1. Starting a Project, This includes the planning and requirements gathering for the application. 2. Code the application, This includes implementing the features into the application based off the requirements gathered. 3.	Debugging the application, This includes Unit-Testing, Integration Testing, and Logging/Tracing components of the application to identify and fix errors in the application before it is completed. 4. Monitoring the application, This includes monitoring the applications performance, integrating analytics tools to gather usage data, and gathering feedback from users to help improve the application.'),
	('Give a basic explanation in terms of Documenting applications.','Documenting applications includes providing explanations and details within the code and external documents to improve readability and understanding of how the application, and the code inside it, works.'),
	('Give a basic explanation of Data Persistence','Data persistence includes ensuring the longevity of data, helping ensure that it stays intact and accessible etc even after an app is closed, The way this is done includes saving the data to long-term storage like a hard drive/cloud service (preferably a cloud service in case the hard drive gets damaged).'+
	'Whichever way you store your data, whether on your device or on the cloud, the data can be retrieved for use etc later without being lost between uses.'),
	('Describe a few benefits of using noSQL.','A few benefits using noSQL include 1. Replication/High Availability, This includes NoSQL databases enabling auto scaling and zero downtime etc on cloud servers, helping ensure for continuous data replication/availability/etc across multiple servers.'+
	' 2. High Speed/Low Latency, This includes noSQL databases being able to handle large volumes of data quickly using a scale-out like architecture, where adding more nodes/computers to the cluster helps enhance performance.' +
	' 3. Flexible Data Models, This includes noSQL allowing for storing unstructured/semi-structured data without the need for pre-defined indexes/schemas, helping to make updates easier and faster.'),
	('give a basic explanation of noSQL schema free model in comparison to SQL Data model','1. NoSQLs schema free model helps allow you to store data without a fixed structure, making it extremely flexible for different data types whilst also focusing on availability/partition tolerance.'+
	' 2. relational databases require strict schemas, and also emphasise consistency, making them potentially less flexible than NoSQL. '),
	('Explain the Difference between scaling out and scaling up (Horizontal and vertical scaling).','1. Vertical scaling (scaling up) includes increasing the power of a single node/machine by adding more resources, making it more simple but comes at a potentially massive cost including limited capacity and a single point of failure.' +
	' 2. Horizontal scaling (scaling out) includes adding more nodes/machines to help share the workload across multiple nodes/machines, helping to provide better resilience and scalability but with a cost including higher complexity.'),
	('can you use Object-Oriented languages for noSQL applications?','yes, you can use Object Oriented Programming (OOP) Languages for NoSQL applications, in fact, they are actually pretty well-suited for noSQL applications because NoSQL databases can store data in a way that is similar with how objects are represented in OOP languages, A few examples of this include' +
	' 1. Key-value stores in noSQL can be represented as objects with properties in OOP languages.' +
	' 2. Document-Based Databases including MongoDB can also store data in structures including/similar to JSON, which can also be mapped to objects in OOP Languages.'),
	('Describe authorisation and authentications procedures and levels of responsibility according to client access requirements.','Authentication includes basically verifying a users identity mainly through methods including passwords/MFA, helping to ensure that only authorized users can access the system, the users, in this context, are responsible for securing their credentials(username, email, password).'+
	' Authorization includes determining what actions a authenticated/verified user is allowed to perform, mainly based on granted permissions, Admins normally manage these access levels, helping to ensure that all users can only perform access on their system that they are meant to be able to do.'),
	('hot','cold'),
	('string','Default Response.'),
    ('cold', 'hot'),
	('unknown','Sorry, I dont understand that input!');
GO

