Create table usuario (idusuario serial not null primary key, 
                     nome varchar(50), login varchar(50), senha varchar(50), 
                      tipo varchar(50), email varchar(50), sobrenome varchar(50), 
                      cidade varchar(50), trabant varchar(80), 
                     trabatual varchar(80), CRM varchar(20), 
			              cpf varchar(50));

create table mural (idmural serial not null primary key, idusuario int,
                   titulo text, texto text,
                   foreign key (idusuario) references usuario(idusuario));

create table favorito (idfavorito serial not null primary key,
                      idusuario1 int, idusuario2 int,
                      foreign key (idusuario1) references usuario (idusuario),
                      foreign key (idusuario2) references usuario (idusuario));

create table avaliacao (idavaliacao serial not null primary key,
                        nota float, idusuatrib int, idusurec int,
                          foreign key (idusuatrib) references usuario (idusuario),
                          foreign key (idusurec) references usuario (idusuario));

create table forummedico (idforummedico serial not null primary key,
                         idusuario int, titulo text, texto text,
                         foreign key (idusuario) references usuario (idusuario));

create table comentarioforummedico (idcomentarioforummedico serial not null primary key,
                                   comentario text, idpostforummedico int, idusuario int,
                                   foreign key (idusuario) references usuario(idusuario),
                                   foreign key (idpostforummedico) references forummedico (idforummedico));


select idpostforummedico, idcomentarioforummedico, titulo, texto, nome, comentario
	from comentarioforummedico, usuario, forummedico
		where comentarioforummedico.idusuario = usuario.idusuario
        	and comentarioforummedico.idpostforummedico = forummedico.idforummedico
			and idforummedico = 14

select idpostforummedico, idcomentarioforummedico, usuario.idusuario as idusuario, titulo, texto, comentario
  from comentarioforummedico, usuario, forummedico
	  where comentarioforummedico.idusuario = usuario.idusuario
		  and comentarioforummedico.idpostforummedico = forummedico.idforummedico
		  and idforummedico = '"+id+"' ORDER BY idcomentarioforummedico DESC

insert into avaliacao (nota, idusuatrib, idusurec) values (5, 2, 1)

select usuario.idusuario, cast(avg(nota) as numeric (3,2)) as media, usuario.nome, usuario.sobrenome, usuario.tipo,
  usuario.cidade, usuario.trabatual, usuario.trabant, usuario.email
from usuario, usuario as u2, avaliacao
where usuario.idusuario = avaliacao.idusuatrib
      and avaliacao.idusurec = u2.idusuario
group by usuario.idusuario, usuario.nome, usuario.sobrenome, usuario.tipo, usuario.cidade,
  usuario.trabatual, usuario.trabant, usuario.email


select usuario.idusuario, cast(avg(nota) as numeric (3,1)) as media, usuario.nome, usuario.sobrenome, usuario.tipo,
  usuario.cidade, usuario.trabatual, usuario.trabant, usuario.email
from usuario,  avaliacao
where avaliacao.idusurec = usuario.idusuario
      and idusuario != 33
group by usuario.idusuario, usuario.nome, usuario.sobrenome, usuario.tipo, usuario.cidade,
  usuario.trabatual, usuario.trabant, usuario.email

UNION

select usuario.idusuario, NULL as media, usuario.nome, usuario.sobrenome, usuario.tipo,
  usuario.cidade, usuario.trabatual, usuario.trabant, usuario.email
from usuario  WHERE idusuario != 33 and not exists (select * from avaliacao where avaliacao.idusurec = usuario.idusuario)
ORDER BY sobrenome;



select*from usuario;
select*from mural;
select*from favorito;
select*from avaliacao;
select * from comentarioforummedico;
select * from forummedico;

delete from usuario where idusuario >= 0
delete from favorito where idfavorito >= 0
delete from avaliacao where idavaliacao >= 0
delete from forummedico where idforummedico >= 0
delete from comentarioforummedico where idcomentarioforummedico >= 0
delete from mural where idmural >= 0

/*
pra teste
select usuario.idusuario, AVG(nota) as media, usuario.nome, usuario.sobrenome, usuario.tipo,
	usuario.cidade, usuario.trabatual, usuario.trabant, usuario.email
      from usuario, usuario as u2, avaliacao
        where usuario.idusuario = avaliacao.idusuatrib
          and avaliacao.idusurec = u2.idusuario
            group by usuario.idusuario, usuario.nome, usuario.sobrenome, usuario.tipo, usuario.cidade,
            usuario.trabatual, usuario.trabant, usuario.email
UNION

select usuario.idusuario, NULL as media, usuario.nome, usuario.sobrenome, usuario.tipo,
	usuario.cidade, usuario.trabatual, usuario.trabant, usuario.email
      from usuario  WHERE not exists (select * from avaliacao where avaliacao.idusurec = usuario.idusuario)
ORDER BY sobrenome;

select*from avaliacao
delete from avaliacao where idavaliacao >=0
select*from usuario
insert into avaliacao (nota, idusurec, idusuatrib) values (5, 13, 14)
*/