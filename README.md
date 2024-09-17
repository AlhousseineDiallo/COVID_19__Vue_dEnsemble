# Documentation et Reporting du Projet d'Analyse des Données COVID-19

### Structure du Répertoire
Le projet est structuré comme suit :

- **README.md** : Ce fichier fournit une vue d'ensemble sur la structure du repo, sur la documentation technique du projet et un Reporting.

- **src/** : Ce dossier contient le code source, les datasets et les fichiers liés à l'analyse.
  - **data/** : Ce sous-dossier contient les fichiers de données.
    - **data** : Contient les fichiers ZIP des différentes données utilisées pour le projet.
  - **main/** : Contient les codes sql pour l'analyse exploratoire et le prétraitement des données.
  - **Tableau Dashboard/** : Contient les tableaux de bord créés avec Tableau pour la visualisation des données.

## 1. Introduction

Ce projet analyse les données relatives aux décès et aux cas de COVID-19 pour fournir des insights sur l'évolution de la pandémie, les tendances régionales et les impacts par pays et continent. Les analyses incluent des taux de mortalité, des comparaisons entre pays, et des visualisations des effets des vaccinations.

## 2. Analyse des Données de Décès

- **Cas et Décès Quotidiens par Pays** : Cette analyse présente le nombre de nouveaux cas et décès par pays, classés par pays et date, pour suivre l'évolution quotidienne de la pandémie.

- **Total des Cas et Décès par Continent** : Agrégation des cas et décès totaux par continent pour évaluer l'impact global sur chaque continent.

- **Taux de Mortalité par Continent** : Calcul du taux de mortalité par continent en utilisant les cas et décès totaux. Ce taux est exprimé en pourcentage de décès par rapport aux cas totaux.

- **Taux de Mortalité par Pays** : Calcul du taux de mortalité par pays, offrant une vue détaillée des taux de mortalité au niveau national.

- **Taux de Mortalité des Pays Africains** : Analyse spécifique du taux de mortalité pour les pays du continent africain.

- **Pays avec le Plus Grand Nombre de Décès** : Identification des pays ayant le nombre total de décès le plus élevé.

- **Pays avec le Plus Grand Nombre de Décès par Population** : Calcul du pourcentage de décès par rapport à la population pour identifier les pays les plus touchés proportionnellement.

- **Pays avec le Plus Faible Nombre de Décès** : Identification des pays ayant le nombre total de décès le plus bas.

- **Jour avec le Plus Grand Nombre de Décès** : Détermination du jour où le nombre quotidien de décès a été le plus élevé.

- **Jour avec le Plus Bas Nombre de Décès** : Détermination du jour où le nombre quotidien de décès a été le plus bas.

- **Continent avec le Plus Grand Nombre de Décès** : Identification du continent avec le nombre total de décès le plus élevé.

- **Chiffres Globaux des Cas et Décès** : Calcul des cas et décès totaux globaux, ainsi que du pourcentage de décès par rapport aux cas totaux.

- **Pays avec le Plus Haut Taux d'Infection** : Identification des pays avec le plus haut taux d'infection en fonction du nombre total de cas et de la population.

- **Pays avec le Plus Grand Nombre de Cas de COVID-19** : Identification des pays avec le plus grand nombre total de cas de COVID-19.

- **Pays Africains avec le Plus Grand Nombre de Cas** : Analyse spécifique des pays africains ayant le plus grand nombre de cas.

- **Total des Cas au Togo** : Analyse des cas de COVID-19 pour Togo et Guinée, montrant le pays avec le nombre total de cas le plus élevé.

## 3. Analyse des Vaccinations

- **Jointure des Tables Décès et Vaccins** : Fusion des données sur les décès et les vaccinations pour une analyse combinée.

- **Population Vaccinée** : Calcul du nombre total de vaccinations et du pourcentage de la population vaccinée par pays.

## 4. Création de Vue

- **Vue sur la Population Vaccinée** : Création d'une vue pour afficher le nombre de personnes vaccinées au fil du temps par pays, en utilisant une somme cumulative des nouvelles vaccinations.

## 5. Reporting et Recommandations

### Taux de Mortalité et Impact par Continent

- **Observation :** Les taux de mortalité varient considérablement entre les continents, avec certains continents montrant des taux beaucoup plus élevés que d'autres.
- **Recommandation :** Les autorités sanitaires devraient concentrer leurs efforts sur les continents et les pays avec les taux de mortalité les plus élevés. Des campagnes de sensibilisation, des ressources médicales supplémentaires et des stratégies de prévention ciblées pourraient être nécessaires pour ces régions.

### Analyse des Décès et des Cas par Pays

- **Observation :** Les pays avec le plus grand nombre total de décès ne coïncident pas toujours avec ceux ayant le plus grand nombre de cas ou le plus haut taux de mortalité par population.
- **Recommandation :** Il est essentiel d'examiner les facteurs locaux, tels que les systèmes de santé, les politiques de confinement, et les campagnes de vaccination, pour comprendre ces disparités. Les pays avec des décès élevés mais peu de cas peuvent nécessiter des améliorations dans les soins de santé ou des interventions pour mieux contrôler la pandémie.

### Analyse des Vaccinations

- **Observation :** Le pourcentage de population vaccinée varie largement entre les pays, avec des pays ayant des taux de vaccination élevés montrant souvent des taux de mortalité plus faibles.
- **Recommandation :** Accélérer les campagnes de vaccination, surtout dans les pays avec des taux de vaccination bas. Les politiques de soutien à l'achat et à la distribution de vaccins, ainsi que des stratégies pour surmonter les hésitations vaccinales, sont cruciales pour améliorer la couverture vaccinale.

### Tendances Quotidiennes des Décès

- **Observation :** Les jours avec des pics élevés de décès montrent des tendances que les politiques de santé publique peuvent utiliser pour ajuster les interventions.
- **Recommandation :** Utiliser les données sur les pics de décès pour adapter les politiques de confinement et les ressources médicales. En période de hausse des décès, il est important de renforcer les mesures de santé publique et de préparer les systèmes de santé à une demande accrue.

### Comparaison Régionale

- **Observation :** Les comparaisons entre régions montrent des variations importantes dans les taux d'infection et de mortalité.
- **Recommandation :** Adapter les politiques de santé publique en fonction des spécificités régionales. Les régions avec des taux élevés d'infection ou de mortalité pourraient bénéficier de mesures plus strictes ou d'une surveillance accrue.

### Recommandations Stratégiques Basées sur les Données

- **Surveillance Continue :** Mettre en place une surveillance continue pour suivre les tendances des cas et des décès, ainsi que les taux de vaccination.
- **Planification de la Réponse :** Utiliser les données pour planifier les réponses d'urgence et allouer les ressources de manière plus efficace.
- **Communication :** Améliorer la communication des risques et des recommandations sanitaires au public, en utilisant des données actualisées pour informer les politiques et les comportements.

## 6. Tableau de Bord

Pour explorer le tableau de bord interactif, veuillez visiter le lien suivant :  
[Tableau de Bord Cyclistic sur Tableau Public](https://public.tableau.com/app/profile/ahlousseine.diallo/viz/CyclisticCaseStudy_17265589409460/DivvyDashboard)


---

Ce fichier `README.md` combine la documentation du projet avec le reporting et les recommandations, ainsi qu'une section dédiée aux captures d'écran du tableau de bord pour une présentation visuelle des analyses effectuées. Assure-toi d'ajuster le chemin d'accès à la capture d'écran du tableau de bord selon l'emplacement réel de ton fichier.
