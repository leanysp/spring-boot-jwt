/* Populate tables */
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(1,'Leanys','Pineda','leanysp@gmail.com','2019-10-02','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(2,'Ho','Tolosa','htolosam@gmail.com','2019-10-02','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(3,'Aria','Tolosa','leanysp@gmail.com','2020-01-14','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(4,'Sebastian','Pineda','sebastian@gmail.com','2020-01-14','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(5,'Oscar','Pineda','oscar@gmail.com','2020-01-14','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(6,'Jader','Tolosa','jader@gmail.com','2020-01-14','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(7,'Dariel','Pineda','dariel@gmail.com','2020-01-14','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(8,'Jaime','Pineda','jaime@gmail.com','2020-01-14','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(9,'Ana','Ortega','ana@gmail.com','2020-01-14','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(10,'Victor','Pineda','victor@gmail.com','2020-01-17','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(11,'Norma','Pineda','norma@gmail.com','2020-01-17','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(12,'Yuranis','Ortega','yuranis@gmail.com','2020-01-17','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(13,'Sofia','Correa','sofia@gmail.com','2020-01-17','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(14,'Daniel','Medina','daniel@gmail.com','2020-01-17','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(15,'Miguel','Medina','miguel@gmail.com','2020-01-17','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(16,'Samuel','Medina','samuel@gmail.com','2020-01-17','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(17,'Obeimar','Ortega','obeimar@gmail.com','2020-01-17','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(18,'Cristian','Ortega','cristian@gmail.com','2020-01-17','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(19,'Wendy','Ortega','wendy@gmail.com','2020-01-17','');
INSERT INTO clientes(id,nombre,apellido,email,create_at,foto) VALUES(20,'David','Ortega','david@gmail.com','2020-01-17','');

/* Populate tabla productos */
INSERT INTO productos(nombre,precio,create_at) VALUES('Panasonic Pantalla LCD',259990,NOW());
INSERT INTO productos(nombre,precio,create_at) VALUES('Sony Camara digital DSC-W320B',123490,NOW());
INSERT INTO productos(nombre,precio,create_at) VALUES('Apple iPod Shuffle',1499990,NOW());
INSERT INTO productos(nombre,precio,create_at) VALUES('Sony Notebook Z110',37990,NOW());
INSERT INTO productos(nombre,precio,create_at) VALUES('Hewlett Packard Multifuncional F2280',69990,NOW());
INSERT INTO productos(nombre,precio,create_at) VALUES('Bianchi Bicicleta Aro 26',69990,NOW());
INSERT INTO productos(nombre,precio,create_at) VALUES('Mica Comoda 5 Cajones',299990,NOW());

/* creamos algunas facturas */
INSERT INTO facturas(descripcion,observacion,cliente_id, create_at) VALUES('Factura equipos de oficina','null',1,NOW());
INSERT INTO facturas_items(cantidad, factura_id, producto_id) VALUES(1,1,1);
INSERT INTO facturas_items(cantidad, factura_id, producto_id) VALUES(2,1,4);
INSERT INTO facturas_items(cantidad, factura_id, producto_id) VALUES(1,1,5);
INSERT INTO facturas_items(cantidad, factura_id, producto_id) VALUES(1,1,7);

INSERT INTO facturas(descripcion,observacion,cliente_id, create_at) VALUES('Factura Bicicleta','Alguna nota importante!',1,NOW());
INSERT INTO facturas_items(cantidad, factura_id, producto_id) VALUES(3,2,6);


/* creamos algunos usuarios con sus roles */
INSERT INTO users (username, password, enabled) VALUES ('leanys','$2a$10$f6zCoQKsyQiYbdQACk9Slec7UD9clFSAsTN6yROKvwSOfRZFNkZxq', 1);
INSERT INTO users (username, password, enabled) VALUES ('admin','$2a$10$S0/NmDEMWR6v4wnEMmL70uRK496hcbBMxKDJH6FCiAKZ5mkVrN3pi', 1);

INSERT INTO authorities (user_id, authority) VALUES (1, 'ROLE_USER');
INSERT INTO authorities (user_id, authority) VALUES (2, 'ROLE_ADMIN');
INSERT INTO authorities (user_id, authority) VALUES (2, 'ROLE_USER');


