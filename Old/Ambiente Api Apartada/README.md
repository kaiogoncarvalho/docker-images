# Ubuntu 14.04 - Apache2 - PHP 5.6

A Docker image based on Ubuntu 14.04 with PHP 5.6.

### ***IMPORTANTE: 

Este repositório deve estar atualizado para esse passo a passo funcionar, se não estiver necessário atualizar;


# Usage

*** **Antes de iniciar a criação deste container inicie o container criado através do seguinte passo a passo:** http://10.10.100.75/docker/php53

1. Instalar o docker caso não esteja com ele instalado, usar o seguinte comando: 
   *  `sudo apt-get install docker.io`
2. Fazer o clone deste repositório dentro da pasta /home/[sua-home], usar o seguinte comando nessa pasta:
   *  `git clone [http do repositório]`
3. Fazer o clone do repositório http://10.10.100.75/portalpravaler/portalpravaler
dentro da pasta /home/[sua-home]/[seus-projetos], usar o seguinte comando nessa pasta:
   *  `git clone [http do repositório]`
4. Acessar a pasta /home/[sua-home]/php56, pasta do repositorio do **passo 2**, 
nesta pasta criar uma imagem baseado no DockFile desse repositório, usar o seguinte comando nessa pasta:
   *  `sudo docker build -t ubuntu/php5.6:1.0 .`
5. Criar o container baseado no outro repositório baixado, usar o seguinte comando:
   *  `sudo docker run -ti -v /home/[sua-home]/[seus-projetos]/portalpravaler:/var/www/portalpravaler --add-host "backoffice.desenv":172.17.0.2 --add-host "api.backoffice.desenv":172.17.0.2 ubuntu/php5.6:1.0` 
6. Acessar a pasta '/var/www/portalpravaler', usar o seguinte comando:
    * `cd /var/www/portalpravaler`
7. Instalar as bibliotecas do composer, usar os seguintes comando:
    * `composer install --no-scripts`
    * `composer update --no-scripts`
8. Dar permissão para a pasta '/var/www/portalpravaler/app/storage', usar o seguinte comando:
    * `chmod -R 777 /var/www/portalpravaler/app/storage`
9. Fazer os Dumps do Composer, usar os seguintes comandos:    
    * `cd workbench/portal/analytics`
    * `composer dump`
    * `cd ../plugins`
    * `composer dump`
    * `cd ../pravaler-backoffice`
    * `composer dump`
    * `cd ../proposal`    
    * `composer dump`
10. Iniciar o serviço do apache, usar o seguinte comando: 
    * `service apache2 start`
11. Abrir outro Terminal;
12. Salvar as alterações do container
    * Ver o [Container ID], usar o seguinte comando: `sudo docker ps`
    * Para salvar o container usar o seguinte comando: 
    `sudo docker commit -m "- alguma descrição" [Container ID]  ubuntu/php5.6:1.0`
13. Para testar se funcionou acessar a URL http://portalpravaler.dev;
    
    
# Acessar o container que já foi criado:
1. Antes de iniciar este container inicie o container criado através do seguinte passo a passo: http://10.10.100.75/docker/php53
2. Verificar o nome dos container criado
    * `sudo docker ps -a`
3. Iniciar e Acessar o container
    * `sudo docker start -a [Nome do Container]`
4. Dentro do conteiner, iniciar o serviço do apache, usar o seguinte comando: 
    * `service apache2 start`



----

*obs: Há casos, antes de inicar a instalação do ambiente no docker que dependendo da configuração da rede, onde ocorre erros no download dos pacotes, será necessário alterar 
o arquivo `/etc/resolv.conf` definindo duas linhas:* 

```nameserver 10.10.100.72
search idealinvest.local```