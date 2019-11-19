SELECT posts.titulo, COUNT(*) num_etiquetas
FROM posts
	INNER JOIN posts_etiquetas ON posts.id = posts_etiquetas.post_id
    INNER JOIN etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
    GROUP BY posts.id
    ORDER BY num_etiquetas DESC;


SELECT posts.titulo, GROUP_CONCAT(nombre_etiqueta)
FROM posts
	INNER JOIN posts_etiquetas ON posts.id = posts_etiquetas.post_id
    INNER JOIN etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
    GROUP BY posts.id;
    
SELECT *
FROM etiquetas
	LEFT JOIN posts_etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
WHERE posts_etiquetas.etiqueta_id IS NULL;

SELECT c.nombre_categoria, COUNT(*) cant_post
FROM  categorias as c
	INNER JOIN posts AS p ON c.id = p.categoria_id
    GROUP BY c.id
    ORDER BY cant_post DESC
    LIMIT 1;

SELECT u.nickname, COUNT(*) cant_post
FROM usuarios AS u
	INNER JOIN posts AS p ON u.id = p.usuario_id
    GROUP BY u.id
    ORDER BY cant_post DESC;
    
SELECT u.nickname, COUNT(*) cant_post, GROUP_CONCAT(nombre_categoria)
FROM usuarios AS u
	INNER JOIN posts AS p ON u.id = p.usuario_id
    INNER JOIN categorias AS c ON c.id = p.categoria_id
    GROUP BY u.id
    ORDER BY cant_post DESC;
    
SELECT *
FROM usuarios AS u
	LEFT JOIN posts ON u.id = posts.usuario_id
    WHERE posts.usuario_id IS NULL;