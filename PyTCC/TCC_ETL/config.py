import configparser

config = configparser.ConfigParser()
config.read('Y:\Repos\PruebaTCC\PyTCC\settings.ini')
Nombre = config.get('DEFAULT', 'DB_NAME')
Servidor = config.get('DEFAULT', 'DB_SERVER')
Password = config.get('DEFAULT', 'DB_PASSWORD')
##print(config['DEFAULT']['path'])     # -> "/path/name/"
##config['DEFAULT']['path'] = '/var/shared/'    # update
##config['DEFAULT']['default_message'] = 'Hey! help me!!'   # create

##with open('FILE.INI', 'w') as configfile:    # save
  ##  config.write(configfile)