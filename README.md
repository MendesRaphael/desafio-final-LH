# Indicium Academy

Repositório para ser utilizado no desafio para a obtenção da certificação de Analytics Engineer by Indicium, também utilizado durante o desafio final do programa Lighthouse, trilha de dados, para fazer a insgestão das tabelas do SAP do Adventure Works.


- [Repositório original](https://github.com/techindicium/academy-dbt)

## Instruções

Todas as tabelas do banco fonte do SAP da Adventure Works serão carregadas como seeds pelo dbt. Os arquivos .csv com os dados já estão na pasta de seeds.

Para fazer o carregamento de todas as tabelas usem o comando:
- `dbt seed`

Para carregar uma tabela especifíca utilizem o comando
- `dbt seed -s nome_do_csv`

### Problemas comuns

Em caso a linha de comando do dbt fique com o status de estar sempre carregando, ou, o job do comando `dbt seed` fique rodando indefinitivamente mesmo após as 64 tabelas forem carregadas você precisará reiniciar o terminal. Para isso, clique nos três pontos no canto inferior direito ou no lado direito da linha de comando e escolha a opção `Restart IDE`.


## Recursos:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
