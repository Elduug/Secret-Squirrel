import Cocoa

struct Credential {
    let name: String
    let username: String
    let password: String
}

enum Generator {
    // Common names plus specific species; deliberately embedded so the app is fully offline.
    private static let legacyAnimals = """
    aardvark,albatross,alligator,alpaca,anaconda,angelfish,anteater,antelope,armadillo,axolotl
    baboon,badger,bandicoot,barracuda,bat,bear,beaver,beetle,binturong,bison,bluebird,bluefish,boa,bobcat,bonobo,buffalo,butterfly,buzzard
    caiman,camel,capybara,caracal,cardinal,caribou,carp,cassowary,cat,caterpillar,catfish,centipede,chameleon,chamois,cheetah,chickadee,chicken,chimpanzee,chinchilla,chipmunk,cicada,clam,coati,cobra,cockatoo,condor,coral,cormorant,cougar,cow,coyote,crab,crane,cricket,crocodile,crow,cuttlefish
    dachshund,damselfly,deer,dingo,dodo,dog,dogfish,dolphin,donkey,dormouse,dove,dragonfly,duck,dugong,dunlin
    eagle,earthworm,echidna,egret,eland,elephant,elk,emu,ermine
    falcon,ferret,finch,firefly,flamingo,flea,flounder,fly,fossa,fox,frog
    gazelle,gecko,gerbil,gibbon,giraffe,gnat,gnu,goat,goldfinch,goldfish,goose,gopher,gorilla,goshawk,grasshopper,grouse,guanaco,guineafowl,gull,guppy
    haddock,halibut,hamster,hare,harrier,hawk,hedgehog,heron,herring,hippopotamus,hoatzin,hookworm,hornbill,hornet,horse,horsefly,hummingbird,hyena,hyrax
    ibex,ibis,iguana,impala,indri,insect
    jackal,jackrabbit,jaguar,jay,jaybird,jellyfish,jerboa
    kangaroo,katydid,kestrel,kingfisher,kinkajou,kiwi,koala,kookaburra,kouprey,krill,kudu
    ladybird,lamprey,lapwing,lark,lemming,lemur,leopard,liger,lion,lizard,llama,lobster,locust,loon,loris,louse,lynx
    macaque,macaw,magpie,mallard,mammoth,manatee,mandrill,manta,mantis,markhor,marmot,marten,meerkat,millipede,mink,minnow,mole,mongoose,monkey,moose,mosquito,moth,mouflon,mouse,mule,muskox
    narwhal,newt,nighthawk,nightingale,numbat,nuthatch,nutria
    ocelot,octopus,okapi,opossum,orangutan,orca,oriole,oryx,ostrich,otter,owl,ox,oyster
    panda,panther,parakeet,parrot,partridge,peacock,peafowl,pelican,penguin,perch,pheasant,pig,pigeon,pika,pike,piranha,platypus,pony,porcupine,porpoise,possum,prawn,puffin,puma,python
    quagga,quail,quetzal,quokka,quoll
    rabbit,raccoon,ram,rat,rattlesnake,raven,ray,redbird,reindeer,rhea,rhinoceros,roadrunner,robin,rook,rooster
    salamander,salmon,sandpiper,sardine,saola,scorpion,seahorse,seal,serval,shark,sheep,shrew,shrimp,skink,skunk,sloth,snail,snake,snipe,sparrow,spider,spoonbill,squid,squirrel,starfish,starling,stingray,stoat,stork,sturgeon,swallow,swan,swordfish
    tamarin,tapir,tarantula,tarsier,termite,tern,thrush,tick,tiger,toad,toucan,trout,tuna,turkey,turtle
    uakari,urchin,urial
    vicuna,viper,vole,vulture
    wallaby,walrus,warbler,warthog,wasp,weasel,whale,wildcat,wildebeest,wolf,wolverine,wombat,woodchuck,woodpecker,worm,wren
    xenops,xerus
    yak,yellowhammer,yellowjacket
    zebra,zebu,zorilla
    abyssiniancat,affenpinscher,africancivet,africanelephant,africangoldencat,africangroundhornbill,africanjacana,africanpenguin,africanporcupine,africanrockpython,africanwilddog,agouti,akitainu,alaskanhusky,albacore,aldabratortoise,alewife,alleycat,allosaurus,amadina,amazonparrot,americanbadger,americanbulldog,americancoot,americankestrel,americanlobster,americanmarten,americanrobin,americantoad,amurleopard,amurtiger,anchovy,angonoka,anhinga,ankole,ankylosaurus,annelid,anole,arapaima,archerfish,arcticfox,arctichare,arctictern,argali,argentinehornedfrog,arkshell,asianelephant,asiangoldencat,asianwaterbuffalo,auk,auklet,australiancattlehound,australiankelpie,avocet
    babirusa,bactriancamel,baldagle,baleenwhale,balinese,bantam,barbet,barnacle,barnowl,basilisk,baskingShark,basset,bassethound,batfish,beagle,beardeddragon,beardedseal,beauceron,bedbug,belugawhale,bengalcat,bengaltiger,bettong,bichon,bighornsheep,bilby,birdofparadise,birman,bitterling,bittern,blackbear,blackbird,blackbuck,blackfish,blackfly,blackpanther,blackrhino,blacktipshark,blenny,bloodhound,bluebottle,bluejay,bluemorphobutterfly,bluetang,bluewhale,boar,boarfish,booby,bordercollie,borderterrier,borzoi,bowerbird,boxer,boxfish,boxturtle,boykinspaniel,bream,brittanyspaniel,britishshorthair,broadbill,brownbear,browntrout,budgerigar,bullfrog,bullmastiff,bullshark,bullterrier,bunting,burmesecat,burrowingowl,bushbaby,bushbuck,bushmaster,bustard
    cachalot,cactuswren,caddisfly,calf,californiacondor,callingcrab,canary,caneToad,canvasback,carpenterant,carpenterbee,carpetpython,carriercrow,carrioncrow,caspiantiger,cattleegret,cavalier,cecropiamoth,ceylonfrogmouth,chacma,chafer,chanticleer,chartreux,chausie,chevrotain,chihuahua,chinooksalmon,chinstrapPenguin,chital,chowchow,cichlid,cloudedleopard,clownfish,coachwhip,coalfish,cockchafer,cockle,cockroach,collie,colobus,cometmoth,commonfrog,commonseal,compsognathus,conch,cooperhawk,copperhead,corgi,cornsnake,cottonmouth,cottonrat,cowbird,cowfish,crappie,crayfish,crestedpenguin,crestedtern,curlew,cuscus,cushionstar,cuvierbeakedwhale
    dalmatian,darter,dassie,deathwatchbeetle,deepseadragonfish,degus,deserttortoise,dhole,diamondback,diamondpython,dikdik,diplodocus,discus,doberman,dogtick,dorado,douc,dowitcher,drafthorse,dromedary,drongo,drywoodtermite,duiker,dutchshepherd,dwarfmongoose,dwarfRabbit
    easternbluebird,easternchipmunk,easterncoralsnake,easternglasslizard,easternlowlandgorilla,easternnewt,easternquoll,easternwoodrat,ediblefrog,eel,elkhound,emperorPenguin,emperorscorpion,englishbulldog,englishsetter,englishshepherd,englishspringer,entlebucher,eskimodog,eurasianbeaver,eurasianlynx,europeanbadger,europeanrobin,europeanstarling,eyelashviper
    fairybluebird,fairyfly,fairyPenguin,fallowdeer,fangtooth,fatheadminnow,feist,fennec,fiddlercrab,fieldmouse,fieldspaniel,fiordlandpenguin,fisherspider,fishingcat,flathorse,flatworm,flyingfish,flyingsquirrel,flycatcher,foal,fowl,foxhound,foxterrier,frenchbulldog,freshwatercrocodile,frigatebird,frilledlizard,fruitbat,fulmar,furseal
    galago,galapagosPenguin,galapagostortoise,gar,gardenSpider,garpike,gaur,gavial,gemsbok,gentooPenguin,geoffroyscat,germanpinscher,germanshepherd,giantclam,giantpanda,giantSchnauzer,giantsquid,gilaMonster,gilthead,giraffeweevil,glassfrog,glasswingbutterfly,glowworm,goatfish,goblinshark,goby,goldcrest,goldenEagle,goldenLionTamarin,goldenOriole,goldenRetriever,gordonsetter,grayfox,grayling,grayreefshark,graywolf,greatdane,greatwhiteshark,grebe,greenanole,greenbeeEater,greenlanddog,greenlandshark,greenTurtle,greyhound,grizzlybear,groundhog,groundsnake,guillemot,guineapig,gyrfalcon
    hackneyhorse,hagfish,hairstreakbutterfly,hake,hammerheadshark,harborseal,harpseal,harpyEagle,harvestmouse,havanese,hawaiianmonkseal,hazeldormouse,hectorsdolphin,herculesbeetle,hermitcrab,highlandcattle,himalayanCat,hoarybat,hog,hognosesnake,hokkaido,honeybadger,honeybee,honeycreeper,hoopoe,horseshoecrab,howlermonkey,huemul,huntsmanSpider,huskydog,hydra
    icelandicsheepdog,ichneumon,indianElephant,indianGiantSquirrel,indianpangolin,indianrhinoceros,indianstarTortoise,indochineseTiger,indigobunting,irrawaddydolphin,irishsetter,irishterrier,irishwolfhound,isopod,italiangreyhound,ivorybilledwoodpecker
    jackdaw,jackrussell,jaguarundi,japaneseBeetle,japaneseChin,japaneseMacaque,japaneseSpitz,javanRhinoceros,javaneseCat,javelina,johnDory,jumpingSpider,junebug,junglecat,junco
    kakapo,kalugaSturgeon,kangal,kangarooRat,keeshond,kelpCrab,kelpGull,kelpie,kempRidleyTurtle,kenyancat,kereru,kerryBlueTerrier,kid,killdeer,kinabaluGiantLeech,kingCobra,kingCrab,kingPenguin,kitFox,kittiwake,klipspringer,knifefish,kob,kodiakBear,komodoDragon,korat,koriBustard,krait,kulan
    labradoodle,labradorRetriever,lacewing,ladybug,lagotto,lakelandTerrier,leafcutterAnt,leafhopper,leafySeadragon,leatherbackTurtle,leech,leghornChicken,leopardCat,leopardFrog,leopardGecko,leopardSeal,leopardShark,lesserPanda,limpet,linxSpider,lionfish,littlePenguin,lizardfish,loach,longhornBeetle,longhornCow,longnoseGar,lovebird,lowlandGorilla,lurcher,lyrebird
    macaroniPenguin,mackenzieWolf,mackerel,madagascarHissingCockroach,maineCoon,malayanCivet,malayanTapir,malinois,maltese,mamba,manedWolf,mangabey,marineIguana,marlin,marshFrog,marshHarrier,maskedBooby,mastiff,mayfly,mediterraneanMonkSeal,merganser,merlin,mexicanAlligatorLizard,mexicanFreeTailedBat,microraptor,midwifeToad,milkSnake,miniaturePinscher,miniatureSchnauzer,mockingbird,moleCrab,molly,monarchButterfly,mongrel,monitorLizard,monkfish,monkParakeet,moorhen,morayEel,mountainGoat,mountainGorilla,mountainLion,mudpuppy,mudskipper,muskDeer,muskrat,mussel,myna
    nakedMoleRat,nandu,nankeenKestrel,napoleonWrasse,natterjackToad,nautilus,neanderthal,newfoundlandDog,nileCrocodile,nineBandedArmadillo,norfolkTerrier,northernCardinal,northernFurSeal,northernInuit,northernPike,northernPotoo,norwegianElkhound,norwegianForestCat,norwichTerrier,nudibranch,nurseShark
    oarfish,ocicat,oilbird,oldEnglishSheepdog,olm,onager,orangetipButterfly,orbWeaver,orientalCat,ornateHawkEagle,oscarFish,osprey,otterhound,ovenbird,owlet,oxpecker
    pacificWalrus,paddlefish,pademelon,papillon,paradiseFlycatcher,parrotfish,pearlOyster,pearlyNautilus,pekingese,peregrineFalcon,periwinkle,persianCat,phoebe,piedTamarin,piglet,pilotWhale,pineMarten,pineSiskin,pineSnake,pinkFairyArmadillo,pinkSalmon,pinktoeTarantula,pinworm,pipefish,pitbull,pitViper,plainsZebra,planarian,plover,poisonDartFrog,polecat,pomeranian,pomfret,pondSkater,poodle,potoroo,prairieDog,prayingMantis,proboscisMonkey,pronghorn,pufferfish,pug,puli,purpleEmperor,pussMoth,pygmyHippo,pygmyMarmoset
    queenAngelfish,queenSnake,queenslandHeeler,quetzalcoatlus,quillback,quinoCheckerspot
    ragdollCat,rail,rainbowLorikeet,rainbowTrout,ratSnake,redAdmiral,redDeer,redFox,redKangaroo,redPanda,redWolf,redbackSpider,redboneCoonhound,redfin,redpoll,redstart,reefShark,reticulatedPython,ringedSeal,ringtail,riverDolphin,riverOtter,rockCrab,rockHopperPenguin,rockfish,roseateSpoonbill,rottweiler,roughCollie,royalPenguin,russianBlue
    sable,sableAntelope,sacredIbis,saiga,saintBernard,samoyed,sandDollar,sandTigerShark,sawfish,scarab,scarletIbis,schipperke,schnauzer,scopsOwl,seaAnemone,seaBass,seaDragon,seaLion,seaOtter,seaSlug,seaSnake,seaSpider,seaTurtle,seaUrchin,sealyhamTerrier,secretaryBird,sharPei,shibaInu,shihTzu,shoebill,shortfinMako,siamang,siameseCat,siberianCat,siberianHusky,siberianTiger,silkyTerrier,silverbackGorilla,skate,skipjackTuna,slowLoris,slug,smelt,snowCrab,snowLeopard,snowshoeHare,sockeyeSalmon,softshellTurtle,somaliCat,southChinaTiger,southernCassowary,southernElephantSeal,spanishMastiff,spectacledBear,spermWhale,spiderMonkey,spinyLobster,spittingCobra,springbok,springerSpaniel,stagBeetle,steelheadTrout,stickInsect,stickleback,stonefish,sugarGlider,sulcataTortoise,sunBear,sunfish,swedishVallhund
    tadpole,tamaskan,tanager,tang,tasmanianDevil,tawnyOwl,teddyBearHamster,tegu,tench,tenrec,terrier,thornyDevil,threeToedSloth,thylacine,tibetanMastiff,tibetanSpaniel,tibetanTerrier,tigerBeetle,tigerMoth,tigerSalamander,tigerShark,titmouse,tortoise,towhee,treeFrog,treeKangaroo,treecreeper,triceratops,triggerfish,tuatara,tundraSwan,turkishAngora,turkishVan,tussockMoth
    uguisu,ulyssesButterfly,umbrellaBird,unicornfish,upupa
    vampireBat,vampireSquid,vaquita,velvetWorm,vervetMonkey,vineSnake,vinegaroon,vizsla
    walkingStick,walleye,waterBoatman,waterBuffalo,waterDragon,waterVole,weaverBird,weimaraner,welshCorgi,welshTerrier,westHighlandTerrier,westernGorilla,westernLowlandGorilla,westernRatSnake,whippet,whiptailLizard,whiteRhinoceros,whiteTiger,whitefish,whitetailDeer,whiting,whoopingCrane,wildBoar,wildHorse,wolfEel,wolfSpider,wolffish,woollyMammoth,woollyMonkey,wrasse
    xantusHummingbird,xeme,xenopus,xoloitzcuintli
    yabbie,yellowAnaconda,yellowBelliedMarmot,yellowEyedPenguin,yellowfinTuna,yellowtail,yorkshireTerrier
    zander,zebraFinch,zebraShark,zebraTurkeyfish,zebrafish,zokor,zonkey,zorse
    """.split { $0 == "," || $0 == "\n" }.map(String.init)

    // Curated for recognition rather than maximum size: these are animals most
    // people are likely to know, have seen, or have heard about.
    static let animals = """
    aardvark,albatross,alligator,alpaca,anaconda,angelfish,anteater,antelope,ape,armadillo,axolotl
    baboon,badger,baldEagle,barracuda,bat,bassetHound,bear,beagle,beaver,bee,beetle,bengalTiger,bighornSheep,bison,blackBear,blackbird,blueJay,blueWhale,boa,bobcat,borderCollie,boxer,buffalo,bull,bullfrog,butterfly,buzzard
    caiman,camel,canary,capybara,caribou,carp,cat,caterpillar,catfish,centipede,chameleon,cheetah,chicken,chimpanzee,chinchilla,chipmunk,cicada,clam,clownfish,cobra,cockatoo,cockroach,cod,collie,condor,coral,cougar,cow,coyote,crab,crane,crayfish,cricket,crocodile,crow,cuckoo,cuttlefish
    dachshund,dalmatian,deer,dingo,dinosaur,doberman,dodo,dog,dolphin,donkey,dove,dragonfly,duck,dugong
    eagle,earthworm,echidna,eel,egret,elephant,elk,emu
    falcon,ferret,finch,firefly,flamingo,flea,fly,flyingFish,flyingSquirrel,fox,frenchBulldog,frog,fruitBat
    gazelle,gecko,gerbil,gibbon,giraffe,goat,goldfish,goose,gopher,gorilla,grasshopper,grayWolf,greatDane,greatWhiteShark,greenTurtle,grizzlyBear,guineaPig,gull,guppy
    hamster,hare,harpSeal,hawk,hedgehog,hermitCrab,heron,herring,hippopotamus,honeyBadger,honeybee,hookworm,hornbill,hornet,horse,horseshoeCrab,housefly,howlerMonkey,hummingbird,husky,hyena
    ibex,ibis,iguana,impala,inchworm
    jackal,jackRabbit,jaguar,jay,jellyfish
    kangaroo,kangarooRat,katydid,kestrel,killerWhale,kingCobra,kingCrab,kingfisher,kiwi,koala,komodoDragon,kookaburra,krill
    ladybug,lamb,lamprey,lark,leafcutterAnt,leech,lemming,lemur,leopard,leopardGecko,leopardSeal,lion,lionfish,lizard,llama,lobster,locust,loon,loris,lovebird,lynx
    macaque,macaw,mackerel,magpie,maineCoon,mallard,mammoth,manatee,mandrill,mantaRay,mantis,marlin,marmot,mastiff,mayfly,meerkat,millipede,mink,minnow,mockingbird,mole,mongoose,monkey,moose,mosquito,moth,mountainGoat,mountainLion,mouse,mule,muskOx,muskrat,mussel
    narwhal,newt,nightingale,nurseShark
    ocelot,octopus,okapi,opossum,orangutan,orca,oriole,ostrich,otter,owl,ox,oyster
    panda,panther,parakeet,parrot,parrotfish,partridge,peacock,pekingese,pelican,penguin,perch,peregrineFalcon,pheasant,pig,pigeon,pika,pike,piranha,pitBull,platypus,polarBear,pony,poodle,porcupine,porpoise,possum,prairieDog,prawn,pufferfish,puffin,pug,puma,python
    quail,queenBee,queenSnake
    rabbit,raccoon,ram,rat,rattlesnake,raven,ray,redDeer,redFox,redKangaroo,redPanda,redWolf,reindeer,rhinoceros,riverOtter,roadrunner,robin,rooster,rottweiler
    salamander,salmon,sandDollar,sandpiper,sardine,scallop,scorpion,seahorse,seal,seaLion,seaOtter,seaSlug,seaTurtle,seaUrchin,shark,sheep,shepherdDog,shihTzu,shrew,shrimp,siameseCat,siberianHusky,siberianTiger,silverfish,skink,skunk,sloth,slug,snail,snake,snowLeopard,sockeyeSalmon,spaniel,sparrow,spider,spiderMonkey,spinyLobster,spoonbill,squid,squirrel,starfish,starling,stingray,stoat,stork,sturgeon,sugarGlider,swallow,swan,swordfish
    tadpole,tamarin,tapir,tarantula,tasmanianDevil,termite,tern,tick,tiger,tigerShark,toad,tortoise,toucan,treeFrog,treeKangaroo,triceratops,trout,tuna,turkey,turtle
    vampireBat,vampireSquid,vole,vulture
    wallaby,walrus,warthog,wasp,waterBuffalo,weasel,whale,whippet,whiteRhino,whiteTiger,wildBoar,wildebeest,wolf,wolverine,wombat,woodchuck,woodpecker,worm,wren
    yak,yellowfinTuna,yellowjacket
    zebra,zebraFinch,zebraShark
    """.split { $0 == "," || $0 == "\n" }.map(String.init)

    static let adjectives: [Character: [String]] = [
        "a": ["amazing", "adventurous", "agile", "amiable", "awesome", "alert", "ambitious", "artful", "assured", "astounding"],
        "b": ["brave", "bouncy", "bright", "brilliant", "breezy", "bold", "buoyant", "blissful", "balanced", "bustling"],
        "c": ["clever", "cheerful", "curious", "charming", "cosmic", "calm", "capable", "caring", "colorful", "courageous"],
        "d": ["daring", "dazzling", "delightful", "dynamic", "dreamy", "dapper", "dependable", "devoted", "diligent", "droll"],
        "e": ["eager", "electric", "elegant", "epic", "excellent", "earnest", "ecstatic", "efficient", "enchanted", "enduring"],
        "f": ["fearless", "friendly", "fancy", "fabulous", "fleet", "faithful", "festive", "fiery", "flourishing", "fortunate"],
        "g": ["gentle", "glowing", "graceful", "grand", "groovy", "gallant", "generous", "gleeful", "golden", "gutsy"],
        "h": ["happy", "helpful", "heroic", "honest", "humble", "hardy", "hearty", "hopeful", "hospitable", "humorous"],
        "i": ["inventive", "intrepid", "ideal", "illustrious", "impressive", "imaginative", "incisive", "industrious", "inspired", "invincible"],
        "j": ["jolly", "jaunty", "joyful", "jazzy", "jubilant", "jovial", "judicious", "jumpy", "jocose", "jewelbright"],
        "k": ["kind", "keen", "knightly", "knowledgeable", "kooky", "kindhearted", "kingly", "kinetic", "kittenish", "knowing"],
        "l": ["lively", "lucky", "loyal", "lovely", "luminous", "lighthearted", "logical", "lionhearted", "laudable", "legendary"],
        "m": ["merry", "mighty", "magical", "marvelous", "mellow", "majestic", "mindful", "modest", "motivated", "mirthful"],
        "n": ["nimble", "noble", "nice", "notable", "novel", "natural", "neighborly", "nifty", "nurturing", "noteworthy"],
        "o": ["optimistic", "outstanding", "original", "orderly", "openhearted", "observant", "outgoing", "overjoyed", "opulent", "organized"],
        "p": ["playful", "proud", "peaceful", "plucky", "pleasant", "patient", "perceptive", "polished", "powerful", "precious"],
        "q": ["quick", "quiet", "quirky", "quaint", "queenly", "qualified", "quality", "quickwitted", "quicksilver", "quixotic"],
        "r": ["radiant", "rapid", "reliable", "remarkable", "robust", "ready", "resolute", "resourceful", "rousing", "royal"],
        "s": ["stinky", "smart", "sparkling", "spirited", "stellar", "sincere", "skillful", "sprightly", "steadfast", "sunny"],
        "t": ["talented", "tenacious", "thoughtful", "thrilling", "trusty", "tactful", "terrific", "tidy", "tireless", "tranquil"],
        "u": ["upbeat", "unique", "unstoppable", "urbane", "useful", "undaunted", "understanding", "unflappable", "uplifting", "upright"],
        "v": ["valiant", "vibrant", "victorious", "vivacious", "vivid", "venturesome", "versatile", "vigorous", "virtuous", "visionary"],
        "w": ["witty", "wonderful", "warmhearted", "wise", "whimsical", "welcoming", "wholehearted", "willing", "winsome", "worthy"],
        "x": ["xenial", "xeric", "xanthic", "xenodochial", "xylophonic", "xenogenic", "xerothermic", "xiphoid", "xyloid", "xanthous"],
        "y": ["youthful", "yearning", "yare", "yummy", "yielding", "yeomanly", "yippee", "youthsome", "yonder", "yarely"],
        "z": ["zany", "zealous", "zesty", "zippy", "zenlike", "zestful", "zingy", "zooty", "zappy", "zazzy"]
    ]

    static func parseNames(_ input: String) -> [(display: String, first: String, last: String)] {
        input.components(separatedBy: .newlines).compactMap { raw in
            let line = raw.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !line.isEmpty else { return nil }

            // A quoted nickname takes precedence over the given first name.
            // Supports both straight quotes ("Steve") and smart quotes (“Steve”).
            let nicknamePattern = #"[\"“]([^\"”]+)[\"”]"#
            if let expression = try? NSRegularExpression(pattern: nicknamePattern),
               let match = expression.firstMatch(in: line, range: NSRange(line.startIndex..., in: line)),
               let nicknameRange = Range(match.range(at: 1), in: line),
               let wholeRange = Range(match.range(at: 0), in: line) {
                let nickname = String(line[nicknameRange]).trimmingCharacters(in: .whitespacesAndNewlines)
                let trailing = String(line[wholeRange.upperBound...]).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines.union(CharacterSet(charactersIn: ",")))
                if !nickname.isEmpty && !trailing.isEmpty {
                    return (line, nickname, trailing)
                }
            }

            let comma = line.split(separator: ",", omittingEmptySubsequences: true).map { $0.trimmingCharacters(in: .whitespaces) }
            if comma.count >= 2 {
                // Support both "First, Last" and the common roster form "Last, First".
                // We choose First,Last because that is what the input hint documents.
                return ("\(comma[0]) \(comma[1])", comma[0], comma[1])
            }
            let words = line.split(whereSeparator: { $0.isWhitespace }).map(String.init)
            guard words.count >= 2 else { return nil }
            return (line, words[0], words.dropFirst().joined(separator: " "))
        }
    }

    static func username(first: String, last: String) -> String {
        func clean(_ value: String) -> String {
            value.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
                .lowercased()
                .filter { $0.isLetter || $0.isNumber || $0 == "-" }
        }
        return "\(clean(first)).\(clean(last.replacingOccurrences(of: " ", with: "")))"
    }

    static func password() -> String {
        var generator = SystemRandomNumberGenerator()
        let symbols = Array("!@#$%&*+-=?")
        while true {
            let animal = animals.randomElement(using: &generator)!
            let initial = animal.first!
            let adjective = adjectives[initial]!.randomElement(using: &generator)!
            let noun = animal.prefix(1).uppercased() + animal.dropFirst().lowercased()
            let digits = String(format: "%08d", Int.random(in: 0...99_999_999, using: &generator))
            let symbol = symbols.randomElement(using: &generator)!
            let value = "\(adjective)\(noun)\(digits)\(symbol)"
            if value.count >= 16 { return value }
        }
    }

    static func csv(_ credentials: [Credential]) -> String {
        func quote(_ value: String) -> String { "\"" + value.replacingOccurrences(of: "\"", with: "\"\"") + "\"" }
        return (["Name,Username,Password"] + credentials.map { "\(quote($0.name)),\(quote($0.username)),\(quote($0.password))" }).joined(separator: "\n")
    }
}

final class AppDelegate: NSObject, NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate {
    private var window: NSWindow!
    private var input: NSTextView!
    private var table: NSTableView!
    private var status: NSTextField!
    private var credentials: [Credential] = []

    func applicationDidFinishLaunching(_ notification: Notification) {
        installMainMenu()
        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 820, height: 620), styleMask: [.titled, .closable, .miniaturizable, .resizable], backing: .buffered, defer: false)
        window.title = "Secret Squirrel 🐿️"
        window.center()
        window.minSize = NSSize(width: 680, height: 500)
        self.window = window

        let root = NSStackView()
        root.orientation = .vertical
        root.spacing = 10
        root.edgeInsets = NSEdgeInsets(top: 18, left: 18, bottom: 16, right: 18)
        root.translatesAutoresizingMaskIntoConstraints = false
        window.contentView = NSView()
        window.contentView!.addSubview(root)
        NSLayoutConstraint.activate([
            root.leadingAnchor.constraint(equalTo: window.contentView!.leadingAnchor), root.trailingAnchor.constraint(equalTo: window.contentView!.trailingAnchor),
            root.topAnchor.constraint(equalTo: window.contentView!.topAnchor), root.bottomAnchor.constraint(equalTo: window.contentView!.bottomAnchor)
        ])

        let title = NSTextField(labelWithString: "Generate usernames and passwords")
        title.font = .systemFont(ofSize: 22, weight: .semibold)
        root.addArrangedSubview(title)
        let hint = NSTextField(wrappingLabelWithString: "Enter one person per line as First Last or First, Last. Put a nickname in quotes—Steven \"Steve\" Howser—to use it in the username. Everything runs locally.")
        hint.textColor = .secondaryLabelColor
        root.addArrangedSubview(hint)

        let inputScroll = NSScrollView()
        inputScroll.hasVerticalScroller = true
        inputScroll.borderType = .bezelBorder
        input = NSTextView()
        input.font = .monospacedSystemFont(ofSize: 13, weight: .regular)
        input.string = "Jane Doe\nJohn Smith"
        input.isRichText = false
        inputScroll.documentView = input
        inputScroll.heightAnchor.constraint(equalToConstant: 115).isActive = true
        root.addArrangedSubview(inputScroll)

        let buttons = NSStackView()
        buttons.orientation = .horizontal
        buttons.spacing = 8
        let generate = NSButton(title: "Generate", target: self, action: #selector(generate(_:)))
        generate.keyEquivalent = "\r"
        let copy = NSButton(title: "Copy All", target: self, action: #selector(copyAll(_:)))
        let save = NSButton(title: "Save CSV…", target: self, action: #selector(saveCSV(_:)))
        buttons.addArrangedSubview(generate); buttons.addArrangedSubview(copy); buttons.addArrangedSubview(save)
        buttons.addArrangedSubview(NSView())
        status = NSTextField(labelWithString: "Ready")
        status.textColor = .secondaryLabelColor
        buttons.addArrangedSubview(status)
        root.addArrangedSubview(buttons)

        table = NSTableView()
        table.usesAlternatingRowBackgroundColors = true
        table.allowsMultipleSelection = true
        for (id, heading, width) in [("name", "Name", 190), ("username", "Username", 210), ("password", "Password", 330)] {
            let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(id))
            column.title = heading; column.width = CGFloat(width); column.minWidth = 120
            table.addTableColumn(column)
        }
        table.dataSource = self; table.delegate = self
        let tableScroll = NSScrollView()
        tableScroll.hasVerticalScroller = true; tableScroll.hasHorizontalScroller = true
        tableScroll.borderType = .bezelBorder; tableScroll.documentView = table
        root.addArrangedSubview(tableScroll)
        tableScroll.setContentHuggingPriority(.defaultLow, for: .vertical)

        let footer = NSTextField(labelWithString: "Made with ❤️ by Jake Carter")
        footer.font = .systemFont(ofSize: 11); footer.textColor = .tertiaryLabelColor
        root.addArrangedSubview(footer)
        window.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }

    private func installMainMenu() {
        let mainMenu = NSMenu()

        let appMenuItem = NSMenuItem()
        mainMenu.addItem(appMenuItem)
        let appMenu = NSMenu(title: "Secret Squirrel")
        appMenu.addItem(withTitle: "About Secret Squirrel", action: #selector(NSApplication.orderFrontStandardAboutPanel(_:)), keyEquivalent: "")
        appMenu.addItem(.separator())
        appMenu.addItem(withTitle: "Quit Secret Squirrel", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        appMenuItem.submenu = appMenu

        let editMenuItem = NSMenuItem()
        editMenuItem.title = "Edit"
        mainMenu.addItem(editMenuItem)
        let editMenu = NSMenu(title: "Edit")
        editMenu.addItem(withTitle: "Undo", action: Selector(("undo:")), keyEquivalent: "z")
        let redo = editMenu.addItem(withTitle: "Redo", action: Selector(("redo:")), keyEquivalent: "Z")
        redo.keyEquivalentModifierMask = [.command, .shift]
        editMenu.addItem(.separator())
        editMenu.addItem(withTitle: "Cut", action: #selector(NSText.cut(_:)), keyEquivalent: "x")
        editMenu.addItem(withTitle: "Copy", action: #selector(NSText.copy(_:)), keyEquivalent: "c")
        editMenu.addItem(withTitle: "Paste", action: #selector(NSText.paste(_:)), keyEquivalent: "v")
        editMenu.addItem(withTitle: "Select All", action: #selector(NSText.selectAll(_:)), keyEquivalent: "a")
        editMenuItem.submenu = editMenu

        NSApp.mainMenu = mainMenu
    }

    @objc private func generate(_ sender: Any?) {
        let names = Generator.parseNames(input.string)
        credentials = names.map { person in
            Credential(name: person.display, username: Generator.username(first: person.first, last: person.last), password: Generator.password())
        }
        table.reloadData()
        status.stringValue = credentials.isEmpty ? "No valid names found" : "Generated \(credentials.count) credential\(credentials.count == 1 ? "" : "s")"
    }

    @objc private func copyAll(_ sender: Any?) {
        guard !credentials.isEmpty else { status.stringValue = "Generate credentials first"; return }
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(Generator.csv(credentials), forType: .string)
        status.stringValue = "Copied CSV to clipboard"
    }

    @objc private func saveCSV(_ sender: Any?) {
        guard !credentials.isEmpty else { status.stringValue = "Generate credentials first"; return }
        let panel = NSSavePanel(); panel.allowedContentTypes = [.commaSeparatedText]; panel.nameFieldStringValue = "credentials.csv"
        guard panel.runModal() == .OK, let url = panel.url else { return }
        do { try Generator.csv(credentials).write(to: url, atomically: true, encoding: .utf8); status.stringValue = "Saved \(url.lastPathComponent)" }
        catch { status.stringValue = "Could not save: \(error.localizedDescription)" }
    }

    func numberOfRows(in tableView: NSTableView) -> Int { credentials.count }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let id = tableColumn!.identifier
        let value = id.rawValue == "name" ? credentials[row].name : id.rawValue == "username" ? credentials[row].username : credentials[row].password
        let cell = NSTableCellView(); let text = NSTextView(frame: .zero)
        text.string = value
        text.font = id.rawValue == "password" ? .monospacedSystemFont(ofSize: 12, weight: .regular) : .systemFont(ofSize: 13)
        text.isSelectable = true
        text.isEditable = false
        text.isRichText = false
        text.drawsBackground = false
        text.textContainerInset = NSSize(width: 0, height: 1)
        text.textContainer?.lineFragmentPadding = 0
        text.textContainer?.maximumNumberOfLines = 1
        text.textContainer?.lineBreakMode = .byTruncatingTail
        text.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(text); NSLayoutConstraint.activate([text.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 4), text.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -4), text.topAnchor.constraint(equalTo: cell.topAnchor, constant: 1), text.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -1)])
        return cell
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool { true }
}

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.setActivationPolicy(.regular)
app.run()
