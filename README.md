# rick_and_morty

Resumo do estudo sobre Clean Architecture


Diagrama:
          ┌───────────────────────┐
          │     Presentation      │
          │ (UI / Widgets / Cubit)│
          └───────────┬───────────┘
                      │ chama Use Cases
                      ▼
          ┌───────────────────────┐
          │     Application       │
          │ (Use Cases / Services)│
          └───────────┬───────────┘
                      │ usa Entidades / Interfaces
                      ▼
          ┌───────────────────────┐
          │       Domain          │
          │ (Entities / Interfaces)│
          └───────────▲───────────┘
                      │ implementado por
                      │
          ┌───────────┴───────────┐
          │    Infrastructure     │
          │ (Data Sources / Repos)│
          └───────────────────────┘


Separação por camadas:
    Cada camada tem uma responsabilida e depende apenas da camada acima(abstração).
    As camadas de baixo são camadas de implementações

        Domain -> Regras de negocio(Contem entidades, casos de uso, contrato/repositories)
        Data -> Implementa o contrato do repositorio, tem fontes de dados(API...) e modelos
        Presentation -> Contem a parte visual do app(widgets) e o controle dos estados da tela
        Core -> Utilitários e servições que podem ser acessados de qualquer lugar do app.
        