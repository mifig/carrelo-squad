# CLEANING DB:
puts "1. Cleaning DB..."
Actor.destroy_all
Social.destroy_all
Link.destroy_all
User.destroy_all
puts "   DB cleaned!"

# CREATING ADMIN USER:
puts "2. Creating Admin User..."
User.create!(email: "rscarrelo@gmail.com", password: "111111", admin: true)
puts "   Admin User created!"

# CREATING SOCIAL NETWORKS:
puts "3. Creating Social Networks..."
imdb = Social.new(name: "IMDb", url: "https://www.imdb.com")
image = URI.open("https://ia.media-imdb.com/images/M/MV5BMTU0MTE4Njg3Nl5BMl5BcG5nXkFtZTgwODY0NjQ2OTE@._V1_.png")
imdb.logo.attach(io: image, filename: "imdb", content_type: "image/png")
imdb.save
puts "   IMDb created!"

instagram = Social.new(name: "Instagram", url: "https://www.instagram.com")
image = URI.open("https://cdn-icons-png.flaticon.com/512/87/87390.png")
instagram.logo.attach(io: image, filename: "instagram", content_type: "image/png")
instagram.save
puts "   Instagram created!"

youtube = Social.new(name: "Youtube", url: "https://www.youtube.com/embed/")
image = URI.open("https://cdn-icons-png.flaticon.com/512/48/48968.png")
youtube.logo.attach(io: image, filename: "youtube", content_type: "image/png")
youtube.save
puts "   Youtube created!"

vimeo = Social.new(name: "Vimeo", url: "https://www.vimeo.com")
image = URI.open("https://cdn-icons-png.flaticon.com/512/63/63191.png")
vimeo.logo.attach(io: image, filename: "vimeo", content_type: "image/png")
vimeo.save
puts "   Vimeo created!"

tiktok = Social.new(name: "TikTok", url: "https://www.tiktok.com")
image = URI.open("https://www.edigitalagency.com.au/wp-content/uploads/TikTok-logo-black-circle-transparent-glyph.png")
tiktok.logo.attach(io: image, filename: "tiktok", content_type: "image/png")
tiktok.save
puts "   TikTok created!"

spotlight = Social.new(name: "Spotlight", url: "https://www.spotlight.com/")
image = URI.open("https://www.spotlight.com/Features/Sunlight/Images/SpotlightLogoRound.svg")
spotlight.logo.attach(io: image, filename: "spotlight", content_type: "image/svg")
spotlight.save
puts "   Spotlight created!"

e_talenta = Social.new(name: "e-talenta", url: "https://www.e-talenta.eu/")
image = URI.open("https://stories.e-talenta.eu/assets/images/logo-e-talenta-2017-1466x273.png")
e_talenta.logo.attach(io: image, filename: "e_talenta", content_type: "image/svg")
e_talenta.save
puts "   e-talenta created!"

# CREATING ACTORS:
puts "4. Creating Actors..."
actor1 = Actor.new(
          email: "teresatavares@gmail.com", 
          phone_number: "+351919919191", 
          first_name: "Teresa", 
          last_name: "Tavares",
          bio: "Estreou-se profissionalmente como actriz em 2000 com o enorme sucesso televisivo Jardins Proibidos.
                Desde então construiu uma sólida carreira em Portugal em televisão, cinema e teatro, sendo um dos nomes mais aplaudidos da sua geração.
                No seu vasto currículo contam-se também participações em vários projectos internacionais.
                Em 2012 é uma das fundadoras do Teatro do Vão.",
          height: 169,
          eyes: "Castanhos",
          hair: "Brunette"
        )

file1 = URI.open("https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/0a399f9d-2ddf-4f1d-83e1-09e0c90d9378.jpg/87e544e5459cc5638a99a23de1816723da7ce44b07e5c55d82e3cc26f09d6177/c_limit,f_jpg,h_1200,q_80,w_1200")
file2 = URI.open("https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/49f7660b-d664-4875-90f6-22bde4cfdef6.jpg/5d4c40bdf924c06d37323791003ea3a957b593dab2d7341feec670de5a7a579a/c_limit,f_jpg,h_1200,q_80,w_1200")
file3 = URI.open("https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/56ef6a66-93c4-4a35-ae45-6c38d8f9e4fb.jpg/a08a07133a4686515f4ae8ec01fd7976f32ace391a57eff37999995faabcd237/c_limit,f_jpg,h_1200,q_80,w_1200")
file4 = URI.open("https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/d6940d21-1082-48c1-be94-3534c6030b2c.jpg/015b55a81db8d22051ffa356f0f3aab6768202d176ae4a7ee46fb65094604a8c/c_limit,f_jpg,h_1200,q_80,w_1200")
file5 = URI.open("https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/5fe18755-663e-4cc4-8944-a318664f65e2.jpg/4a679c789399e2863cd3f74ba877349d819b28b9c2c8169d4ef5e5494c02efec/c_limit,f_jpg,h_1200,q_80,w_1200")
file6 = URI.open("https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/8a0fff1a-bbaa-4e17-9f7c-0e2025347273.jpg/01dade06b5d6e3ec51d80c05ac65bcc397726b0e90850ce781f56ff8c7136cd4/c_limit,f_jpg,h_1200,q_80,w_1200")

actor1.primary_photo.attach(io: file1, filename: "#{actor1.first_name}-#{actor1.last_name}", content_type: "image/jpg")
actor1.photos.attach(io: file2, filename: "#{actor1.first_name}-#{actor1.last_name}-1", content_type: "image/jpg")
actor1.photos.attach(io: file3, filename: "#{actor1.first_name}-#{actor1.last_name}-2", content_type: "image/jpg")
actor1.photos.attach(io: file4, filename: "#{actor1.first_name}-#{actor1.last_name}-3", content_type: "image/jpg")
actor1.photos.attach(io: file5, filename: "#{actor1.first_name}-#{actor1.last_name}-4", content_type: "image/jpg")
actor1.photos.attach(io: file6, filename: "#{actor1.first_name}-#{actor1.last_name}-5", content_type: "image/jpg")

actor1_instagram = Link.create(social: instagram, url: "https://www.instagram.com/teresa_tavares/?hl=en", actor: actor1)
actor1_imdb = Link.create(social: imdb, url: "https://www.imdb.com/name/nm1196647/", actor: actor1)
actor1_spotlight = Link.create(social: spotlight, url: "https://www.spotlight.com/", actor: actor1)
actor1_e_talenta = Link.create(social: e_talenta, url: "https://www.e-talenta.eu/members/profile/teresa-tavares", actor: actor1)
actor1_imdbvideo = Link.create(social: imdb, url: "https://www.imdb.com/video/vi3985359385/?ref_=ext_shr_lnk", actor: actor1, video: true)
actor1_youtubevideo = Link.create(social: youtube, url: "6hFqd62GICI", actor: actor1, video: true)
actor1_vimeovideo = Link.create(social: vimeo, url: "https://player.vimeo.com/video/768031556?h=02cbbdc5d5", actor: actor1, video: true)

# pt_cv = File.open("/Users/miguelfigueiredo/Desktop/00_Docs/01_JobApplicationDocs/MotivationLetter_PostGrad_DataScience_Tecnico.pdf")
# en_cv = File.open("/Users/miguelfigueiredo/Desktop/00_Docs/01_JobApplicationDocs/MotivationLetter_PostGrad_DataScience_Tecnico.pdf")
# actor1.pt_cv.attach(io: pt_cv, filename: "#{actor1.first_name}-#{actor1.last_name}-pt-cv", content_type: "application/pdf")
# actor1.en_cv.attach(io: en_cv, filename: "#{actor1.first_name}-#{actor1.last_name}-en-cv", content_type: "application/pdf")

actor1.save

puts "   Actor #{actor1.first_name} #{actor1.last_name} created!"

actor2 = Actor.new(
  email: "vitorsilvacosta@gmail.com", 
  phone_number: "+351919912191", 
  first_name: "Vítor", 
  last_name: "Silva Costa",
  bio: "Vítor Silva Costa é um ator português (Porto, 5 de Maio de 1992).
        Estudou em E.B.1 Guetim. Ator que começou, com 16 anos, a formação teatral na Academia Contemporânea do Espectáculo no Porto, de onde é natural.
        Neste momento frequenta a Escola Superior de Teatro e Cinema, em Lisboa.
        Trabalha profissionalmente em teatro, televisão e cinema. Vive na capital, Lisboa.",
  height: 177,
  eyes: "Castanhos",
  hair: "Preto"
)
file2 = URI.open("https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/11e5f95d-6ac0-4c41-a775-c8caa8c10efc.jpeg/c80a6b34effac39c9429840e6b65d9e3d8b663c19cdecdaae6403553db860325/c_limit,f_jpg,h_1200,q_80,w_1200")
actor2.primary_photo.attach(io: file2, filename: "#{actor2.first_name}-#{actor2.last_name}", content_type: "image/png")
actor2.save
puts "   Actor #{actor2.first_name} #{actor2.last_name} created!"

actor3 = Actor.new(
  email: "raqueltillo@gmail.com", 
  phone_number: "+351919919193", 
  first_name: "Raquel", 
  last_name: "Tillo",
  bio: "Numa vida cheia de cor, Raquel é a lufada de ar fresco que recusa rótulos e apenas procura a felicidade em tudo o que faz.
        Como cantar e ser atriz. É nos palcos que se agiganta, mas é na vida que se conhece por inteiro, sem nunca sucumbir ao preconceito.
        Nesta paleta de sonhos, já viveu em Inglaterra e tem em Nova Iorque a sua casa.
        Aos 28 anos, contudo, encontrou em Lisboa um lar, tendo regressado para integrar o elenco do espetáculo Avenida Q.",
  height: 165,
  eyes: "Castanho Claro",
  hair: "Loiro"
)
file3 = URI.open("https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/56bce039-168a-4d65-bcdf-49cf81439b75.jpg/d3b90f2d38ed012c934c68cabf5fc7bebfd51f80cdd3227c064ce1f8fbbba955/c_limit,f_jpg,h_1200,q_80,w_1200")
actor3.primary_photo.attach(io: file3, filename: "#{actor3.first_name}-#{actor3.last_name}", content_type: "image/png")
actor3.save
puts "   Actor #{actor3.first_name} #{actor3.last_name} created!"

actor4 = Actor.new(
  email: "anavarela@gmail.com", 
  phone_number: "+351919919194", 
  first_name: "Ana", 
  last_name: "Varela",
  bio: "Ana Catarina da Silva Varela (16 de Maio de 1988, Paço dos Negros), conhecida apenas como Ana Varela, é uma atriz portuguesa.
        Fez a série T2 para 3, que começou na internet em 2008 e que passou para a RTP1 em 2009.
        Participou na sétima série de Morangos com Açúcar, no papel de Isabel Faria.
        Em 2011, participou também na série da SIC A Família Mata, juntamente com Rita Blanco e José Pedro Gomes e integrou o elenco principal da série Pai à Força,com a personagem Laura Ribeiro.",
  height: 163,
  eyes: "Castanho Claro",
  hair: "Castanho"
)
file4 = URI.open("https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/152e915f-3331-4b80-8e1d-754b570f6726.JPG/93df1eb36d381ee1538780f0102fb50e33507cef66b690ce5bd2fe673f6bbcb5/c_limit,f_jpg,h_1200,q_80,w_1200")
actor4.primary_photo.attach(io: file4, filename: "#{actor4.first_name}-#{actor4.last_name}", content_type: "image/png")
actor4.save
puts "   Actor #{actor4.first_name} #{actor4.last_name} created!"

actor5 = Actor.new(
  email: "marinaalbuquerque@gmail.com", 
  phone_number: "+351919919195", 
  first_name: "Marina", 
  last_name: "Albuquerque",
  bio: "Frequentou o curso de Teatro no Conservatório.
        Em teatro participou em Confissões de mulheres dos 30. Integrou no elenco de Ana e os Sete, Mundo Meu, A Lenda da Garça, Malucos do Riso, Uma Aventura: Entre as Duas Margens do Rio, Deixa que Te Leve, entre outros.",
  height: 163,
  eyes: "Verdes",
  hair: "Loiro"
)
file5 = URI.open("https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/c76d0743-885b-4566-874a-f7fe7db896c3.jpg/cc9a3e4987e4a159aebef1e9738e7fd63a1dadec1491f4fd2a8ae48f813a42bc/c_limit,f_jpg,h_1200,q_80,w_1200")
actor5.primary_photo.attach(io: file5, filename: "#{actor5.first_name}-#{actor5.last_name}", content_type: "image/png")
actor5.save
puts "   Actor #{actor5.first_name} #{actor5.last_name} created!"

actor6 = Actor.new(
  email: "madalenabrandao@gmail.com", 
  phone_number: "+351919919196", 
  first_name: "Madalena", 
  last_name: "Brandão",
  bio: "Madalena de Azevedo Cordeiro Norton Brandão mais conhecida por Madalena Brandão (Lisboa, 7 de Março em 1980) é uma actriz portuguesa. Popularizou-se com a personagem Camila em Super Pai, continuando depois a integrar o elenco de várias séries e novelas. Em Abril de 2019 lançou, juntamente com Joana Seixas, um blogue na plataforma SAPO com o objetivo de ciar um espaço livre de reflexão sobre a sutentabilidade.",
  height: 164,
  eyes: "Castanho Verde",
  hair: "Loiro"
)
file6 = URI.open("https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/5c831c27-7bd6-4728-9539-fc0cd5a89a25.JPG/2e4d5beae3fc2fda8fe7024877e481817a84a4947b6a3a5e88127af8cce37be4/c_limit,f_jpg,h_1200,q_80,w_1200")
actor6.primary_photo.attach(io: file6, filename: "#{actor6.first_name}-#{actor6.last_name}", content_type: "image/png")
actor6.save
puts "   Actor #{actor6.first_name} #{actor6.last_name} created!"

actor7 = Actor.new(
  email: "barbarabranco@gmail.com", 
  phone_number: "+351919919197", 
  first_name: "Bárbara", 
  last_name: "Branco",
  bio: "Madalena de Azevedo Cordeiro Norton Brandão mais conhecida por Madalena Brandão (Lisboa, 7 de Março em 1980) é uma actriz portuguesa. Popularizou-se com a personagem Camila em Super Pai, continuando depois a integrar o elenco de várias séries e novelas. Em Abril de 2019 lançou, juntamente com Joana Seixas, um blogue na plataforma SAPO com o objetivo de ciar um espaço livre de reflexão sobre a sutentabilidade.",
  height: 165,
  eyes: "Castanho",
  hair: "Castanho"
)
file7 = URI.open("https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/1fa93a9c-0a4f-4bfa-9165-3ff57a89625f.jpg/1fed4dbee45b9c9e7a0bf557fce41f91e28182383d18478b89a2ec3ea5d08360/c_limit,f_jpg,h_1200,q_80,w_1200")
actor7.primary_photo.attach(io: file7, filename: "#{actor7.first_name}-#{actor7.last_name}", content_type: "image/png")
actor7.save
puts "   Actor #{actor7.first_name} #{actor7.last_name} created!"

actor8 = Actor.new(
  email: "soraiatavares@gmail.com", 
  phone_number: "+351919919198", 
  first_name: "Soraia", 
  last_name: "Tavares",
  bio: "Soraia tem 21 anos, é atriz e vem de Carnaxide. Vive com a mãe, que é empregada doméstica, e tem o pai em Cabo Verde há 6 anos (tem uma irmã na Suíça e um irmão no Barreiro). Soraia está no 1º ano da escola superior de teatro e cinema e faz parte do elenco do novo espetáculo de La Féria, ainda em ensaios. Tem feito vários musicais e é nesse âmbito que costuma cantar.
        Está no mundo da música desde os 16. Começou na igreja, mais tarde entrou para um musical amador e foi então que se desenvolveu o seu percurso. Como formação, tirou um curso de teatro musical, onde tinha aulas de canto. O seu género de eleição é o soul e como artistas preferidos cita Beyoncé, Alicia Keys, HMB, Etta James, Rui Veloso…",
  height: 162,
  eyes: "Castanho",
  hair: "Castanho"
)
file8 = URI.open("https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/ddf45afb-5808-4a85-ac84-f9447cea0a53.jpeg/8bd8f753104a1a157123bb464778a4638c5b7ace899e046f804da6861587b20e/c_limit,f_jpg,h_1200,q_80,w_1200")
actor8.primary_photo.attach(io: file8, filename: "#{actor8.first_name}-#{actor8.last_name}", content_type: "image/png")
actor8.save
puts "   Actor #{actor8.first_name} #{actor8.last_name} created!"

puts "Done!"
