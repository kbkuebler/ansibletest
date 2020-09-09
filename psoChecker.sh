function psoChecker() {

count=0
tries=60

while [[ $count != $tries ]]; do
have=$(kubectl get pods pso-csi-controller-0 |awk '{if(NR>1)print $2}'|awk -F'/' '{print $1}')
want=$(kubectl get pods pso-csi-controller-0 |awk '{if(NR>1)print $2}'|awk -F'/' '{print $2}')


  if [[ $have == 0 ]];then
    echo "Waiting for PSO. $have up vs $want desired. $count out of $tries tries."
    ((count++))
    sleep 1
  elif [[ $have != 0 && $have -lt $want ]];then
    echo "Waiting for PSO. $have up vs $want desired. $count out of $tries tries."
    ((count++))
    sleep 1
  elif [[ $have != 0 && $have == $want ]];then
    echo "Looks like PSO is up. $have out of $want up."
    break
  fi

done



}

psoChecker

