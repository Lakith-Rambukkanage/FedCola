goal=YourGoal

ic=1 # number of img clients
tc=1 # number of txt clients
mc=1 # number of img+txt clients
cncntrtn=0.5 # concentration parameter for Dirichlet distribution
c=0.25 # sampling ratio for clients
nt=1 # number of threads for parallel training
b=1 # batch size
root='~/mnt-disk/repos/FedCola/' # root path of the dataset

python main.py --exp_name FedCola --shared_param attn --share_scope modality  --colearn_param none --compensation --with_aux --aux_trained --seed 1 --multi-task --datasets CIFAR100 AG_NEWS Flickr30k Coco --modalities img txt img+txt img+txt --data_paths data/cifar100 data/agnews data/flickr30k data/coco --Ks $ic $tc $mc --test_size -1 --split_type diri --cncntrtn $cncntrtn --model_name mome_small_patch16 --resize 224 --imnorm --algorithm fedavg --eval_type global --eval_every 1 --eval_metrics acc1 --R 5 --C $c --E 5 --B 32 --beta1 0 --optimizer AdamW --lr 1e-4 --lr_decay 0.99 --lr_decay_step 1 --criterion CrossEntropyLoss --num_thread 8 --use_bert_tokenizer --pretrained --goal $goal --equal_sampled --eval_batch_size 512 --reduce_samples 1000 --reduce_test_samples 1000 --reduce_samples_seg_scale 0.3 --reduce_samples_cls_scale 0.3 

