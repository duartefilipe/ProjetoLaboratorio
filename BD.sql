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
                       nota varchar(50), idusuatrib int, idusurec int,
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


select*from usuario;
select*from mural;
select*from favorito;
select*from avaliacao;