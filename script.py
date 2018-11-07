import numpy as np

def get_predicted_clusters(mention_starts, mention_ends, predicted_antecedents):
    mention_to_predicted = {}
    predicted_clusters = []
    for i, predicted_index in enumerate(predicted_antecedents):
        if predicted_index < 0:
            continue
        assert i > predicted_index
        predicted_antecedent = (int(mention_starts[predicted_index]), int(mention_ends[predicted_index]))
        if predicted_antecedent in mention_to_predicted:
            predicted_cluster = mention_to_predicted[predicted_antecedent]
        else:
            predicted_cluster = len(predicted_clusters)  # 0
            predicted_clusters.append([predicted_antecedent])  # -1
            mention_to_predicted[predicted_antecedent] = predicted_cluster  #

        mention = (int(mention_starts[i]), int(mention_ends[i]))
        predicted_clusters[predicted_cluster].append(mention)
        mention_to_predicted[mention] = predicted_cluster

    predicted_clusters = [tuple(pc) for pc in predicted_clusters]
    mention_to_predicted = {m: predicted_clusters[i] for m, i in mention_to_predicted.items()}

    return predicted_clusters, mention_to_predicted

mention_starts = np.array([0, 2, 6, 9])
mention_ends = np.array([0, 3, 6, 9])
predicted_antecedents = [-1, -1, -1, 1]
get_predicted_clusters(mention_starts, mention_ends, predicted_antecedents)
