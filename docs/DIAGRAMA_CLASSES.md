# Diagrama de classes do domínio

Representa as 15 classes de `sistema-eventos/backend/models/`: seus
atributos, seus relacionamentos e os métodos próprios. Os diagramas
foram escritos em [Mermaid](https://mermaid.js.org/), um formato de
texto que o GitHub desenha ao abrir este arquivo.

## Herança

Todas as Models herdam de duas classes. `db.Model`, do SQLAlchemy, liga
a classe a uma tabela do banco. `CRUDMixin`, do próprio projeto, oferece
os métodos de CRUD, sem repeti-los em cada Model.

```mermaid
classDiagram
    direction LR

    class Model["db.Model"]

    class CRUDMixin {
        +salvar(dados)$
        +buscar_por_id(id_registro)$
        +listar_todos()$
        +atualizar(id_registro, dados)$
        +deletar(id_registro)$
    }

    Model <|-- ClassesDoDominio
    CRUDMixin <|-- ClassesDoDominio

    class ClassesDoDominio["As 15 Models"] {
        Usuario
        Organizador
        Evento
        Palestra
        Palestrante
        Localizacao
        PlantaBaixa
        Patrocinador
        Participacao
        Favorito
        Avaliacao
        Notificacao
        Certificado
        Restaurante
        RestauranteEvento
    }
```

A caixa "As 15 Models" resume a herança para não repetir duas setas em
cada classe. Ele não existe no código: cada Model declara a herança, como
em `class Evento(db.Model, CRUDMixin)`.

## Classes e relacionamentos

`PK` é a chave primária, que identifica cada registro. `FK` é a chave
estrangeira, que aponta para o registro de outra classe. Todas as classes
têm também o método `to_dict()`, que devolve os dados para a resposta da
API. Ele foi omitido para o diagrama ficar mais legível.

```mermaid
classDiagram
    direction TB

    class Usuario {
        +int id_usuario PK
        +string nome
        +string email
        +string senha
        +string tipo_usuario
        +string google_id
    }

    class Organizador {
        +int id_organizador PK
        +int id_usuario FK
        +string nivel_acesso
        +bool eh_administrador
        +buscar_por_usuario(id_usuario)$
        +pode_gerenciar(evento)
        +usuario_pode_gerenciar(usuario, evento)$
    }

    class Evento {
        +int id_evento PK
        +string nome
        +text descricao
        +date data_inicio
        +date data_fim
        +string local
        +int id_organizador FK
    }

    class Palestra {
        +int id_palestra PK
        +string titulo
        +text resumo
        +string tema
        +datetime horario_inicio
        +datetime horario_fim
        +int id_evento FK
        +int id_localizacao FK
        +int id_palestrante FK
        +int vagas_total
        +int vagas_disponiveis
        +salvar(dados)$
    }

    class Palestrante {
        +int id_palestrante PK
        +string nome
        +string foto
        +text descricao
        +string rede_social
        +int id_evento FK
    }

    class Localizacao {
        +int id_localizacao PK
        +string nome_local
        +text descricao
        +int id_evento FK
    }

    class PlantaBaixa {
        +int id_planta PK
        +string imagem_mapa
        +text descricao
        +int id_evento FK
    }

    class Patrocinador {
        +int id_patrocinador PK
        +string nome_empresa
        +string logo
        +string site
        +text descricao
        +int id_evento FK
    }

    class Participacao {
        +int id_participacao PK
        +int id_usuario FK
        +int id_palestra FK
    }

    class Favorito {
        +int id_favorito PK
        +int id_usuario FK
        +int id_palestra FK
        +datetime data_favoritacao
    }

    class Avaliacao {
        +int id_avaliacao PK
        +int nota_estrelas
        +text comentario
        +datetime data
        +int id_usuario FK
        +int id_palestra FK
    }

    class Notificacao {
        +int id_notificacao PK
        +text mensagem
        +datetime data_envio
        +string tipo_notificacao
        +int id_usuario FK
        +int id_palestra FK
        +int id_evento FK
    }

    class Certificado {
        +int id_certificado PK
        +string codigo_validacao
        +datetime data_emissao
        +int id_usuario FK
        +int id_evento FK
    }

    class Restaurante {
        +int id_restaurante PK
        +string nome
        +decimal avaliacao
        +decimal distancia
        +string categoria
        +string endereco
    }

    class RestauranteEvento {
        +int id_restaurante PK, FK
        +int id_evento PK, FK
    }

    %% Composição: a parte só existe dentro do todo
    Usuario "1" *-- "0..1" Organizador : perfil de organização
    Evento "1" *-- "0..*" Palestra : programação
    Evento "1" *-- "0..*" Palestrante : convidados
    Evento "1" *-- "0..*" Localizacao : salas e locais
    Evento "1" *-- "0..1" PlantaBaixa : mapa
    Evento "1" *-- "0..*" Patrocinador : patrocínios

    %% Agregação: a parte continua existindo sem o todo
    Localizacao "0..1" o-- "0..*" Palestra : recebe
    Palestrante "0..1" o-- "0..*" Palestra : apresenta

    %% Associações simples
    Organizador "1" -- "0..*" Evento : gerencia
    Usuario "1" -- "0..*" Participacao : se inscreve
    Palestra "1" -- "0..*" Participacao : tem inscritos
    Usuario "1" -- "0..*" Favorito : favorita
    Palestra "1" -- "0..*" Favorito : é favoritada
    Usuario "1" -- "0..*" Avaliacao : avalia
    Palestra "1" -- "0..*" Avaliacao : é avaliada
    Usuario "1" -- "0..*" Notificacao : recebe
    Palestra "0..1" -- "0..*" Notificacao : assunto
    Evento "0..1" -- "0..*" Notificacao : assunto
    Usuario "1" -- "0..*" Certificado : recebe
    Evento "1" -- "0..*" Certificado : emite
    Evento "1" -- "0..*" RestauranteEvento : indica
    Restaurante "1" -- "0..*" RestauranteEvento : é indicado
```

## Como ler os relacionamentos

| Símbolo | Tipo | Critério usado neste projeto |
|---|---|---|
| Losango cheio | **Composição** | A classe depende só do todo: apagar o todo apaga a parte (`ON DELETE CASCADE`) |
| Losango vazio | **Agregação** | A parte continua existindo sem o todo: o vínculo é opcional (`ON DELETE SET NULL`) |
| Linha simples | **Associação** | As duas classes se relacionam, sem que uma seja parte da outra |
| Seta com triângulo vazio | **Herança** | A classe recebe os atributos e métodos da classe mãe |

Os números ao lado das linhas são as **multiplicidades**, ou seja,
quantos objetos de cada lado podem estar ligados. Por exemplo, um
`Evento` tem de `0` a `*` (muitas) palestras, e cada `Palestra` pertence
a exatamente `1` evento.

## Decisões do modelo

- **`Evento` compõe `Palestra`.** Na Model, a relação usa
  `cascade="all, delete-orphan"`. No banco, `palestra.id_evento` usa
  `ON DELETE CASCADE`.
- **`Localizacao` e `Palestrante` agregam `Palestra` com vínculos
  opcionais.** Se a sala ou o palestrante for removido, a palestra
  continua existindo sem esse dado (`ON DELETE SET NULL`).
- **`Participacao`, `Favorito` e `Avaliacao` ligam `Usuario` e
  `Palestra`.** Representam relações de muitos para muitos com dados
  próprios ou regras próprias. Dependem das duas classes ao mesmo tempo,
  então ficam como associações, e não como partes de uma só. A mesma
  pessoa não pode repetir o par com a mesma palestra (restrição `UNIQUE`
  no banco).
- **`RestauranteEvento` liga `Restaurante` e `Evento`** em uma relação
  de muitos para muitos, porque um restaurante pode ser indicado em
  vários eventos.
- **`Organizador` é um perfil de `Usuario`, e não uma subclasse dele.**
  A ligação é feita por `id_usuario`, que é único. Por isso, ela aparece
  como composição, e não como herança.
- **`Evento` e `Organizador` têm `ON DELETE RESTRICT`.** Um organizador
  com eventos não pode ser removido, porque todo evento precisa de um
  responsável.
- **`PlantaBaixa` é única por evento por uma regra do Service.**
  `SalvarPlantaService` atualiza a planta que já existe, em vez de criar
  outra. O banco não tem restrição para isso.
- **Classes ainda sem uso no app.** `Certificado`, `Restaurante` e
  `RestauranteEvento` existem nas Models e no banco, mas ainda não têm
  rota nem tela.
