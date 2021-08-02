**Instructions to deploy to your own minikube cluster**

Provided you have a minikube cluster and git installed already on your linux machine. Please run below commands.

```markup

git clone https://github.com/ankur512512/ecosia.git

cd ecosia

./build.sh

```

**(Optional way to see it in github actions)**

This is the fully automated way of deploying and testing this whole project, without even needing a minikube-cluster.
We will be using minikube from ``github-actions``

  1. Go to this link: https://github.com/ankur512512/ecosia/actions/workflows/mini.yaml
  2. Then click on 'Run workflow' dropdown, keep the branch as 'master' and then again click on the green buttoned 'Run worklow' as show below:
  
  ![image](https://user-images.githubusercontent.com/12583640/127886929-3194e388-32d5-4232-ab68-0159f9aaf4b6.png)

