pacman::p_load(heatmap3, geobr, sf, magrittr, ggplot2, dplyr, car)

# Abrindo a base de dados 
LeisAPACC <- read.csv2("Analise de Conteudo 2 - planilha1.csv",sep = ",", dec = ",")

# Criando o heat map 
heatmap <- data.matrix(`LeisAPACC`) #para transformar em uma matriz de dados
heatmap3::heatmap3(heatmap, col = "my_palette")
my_palette <- colorRampPalette(c("red","red","red"))

# Fazendo o teste Kappa de concordância 

irr::kappa2(Analise_de_conteudo_categorial_Pagina1[-1])

#c?lculo de concord?ncia 
irr::agree(Analise_de_conteudo_categorial_Pagina1[-1])

#Criando o mapa dos municípios 

conj_dados = list_geobr()
brasil = read_municipality(code_muni = "all")
RF = read_municipality(code_muni = 2611903)
TAM = read_municipality(code_muni =2614857)
barreiros = read_municipality(code_muni =2601409)
SJCG = read_municipality(code_muni =2613404)
maragogi= read_municipality(code_muni =2704500)
japaratinga= read_municipality(code_muni =2703601)
PP= read_municipality(code_muni =2707404)
SMM= read_municipality(code_muni =2708709)
PC= read_municipality(code_muni =2706505)
SLQ = read_municipality(code_muni =2708501)
BSA = read_municipality(code_muni =2700508)
paripueira = read_municipality(code_muni =2706448)
maceio = read_municipality(code_muni =2704302)

ggplot() + 
  geom_sf(data = BR_2020, fill = "#FFFAFA", color = "#dcdede", size = .15, 
          show.legend = T) +
  geom_sf(data = RF, fill= "#1E90FF", color="black", size=.15, show.legend = T) + 
  geom_sf(data = TAM,  fill= "#1E90FF", color="black", size=.15, show.legend = T) +
  geom_sf(data = PC, fill= "#1E90FF", color="black", size=.15, show.legend = T) + 
  geom_sf(data = SLQ, fill= "#1E90FF", color="black", size=.15, show.legend = T) + 
  geom_sf(data = BSA, fill="#1E90FF", color="black", size=.15, show.legend = T) +
  geom_sf(data = paripueira, fill="#1E90FF", color="black", size=.15, show.legend = T) + 
  geom_sf(data = maceio, fill="#1E90FF", color="black", size=.15, show.legend = T) +
  geom_sf(data = barreiros, fill="#1E90FF", color="black", size=.15, show.legend = T) +
  geom_sf(data = SJCG, fill="#1E90FF", color="black", size=.15, show.legend = T) +
  geom_sf(data = maragogi, fill="#1E90FF", color="black", size=.15, show.legend = T) +
  geom_sf(data = japaratinga, fill="#1E90FF", color="black", size=.15, show.legend = T) +
  geom_sf(data = PP, fill="#1E90FF", color="black", size=.15, show.legend = T) +
  geom_sf(data = SMM, fill="#1E90FF", color="black", size=.15, show.legend = T) +
  theme_light() +
  labs(x = "Longitude",
       y = "Latitude") +
  ylim(-10,-8.2) +
  xlim(-36.8,-34.5) +
  ggtitle("Municípios da APA Costa dos Corais")