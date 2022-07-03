<div class="container fluid">

	<!-- untuk tampilan kotakan barang -->
	<div class="row text-center mt-4">
		<?php foreach ($kost3 as $brg) : ?>

			<div class="card ml-5 mb-3" style="width: 18rem;">
			  <img class="card-img-top" src="<?php echo base_url().'/uploads/'.$brg->gambar?>" alt="Card image cap">
			  <div class="card-body">
			    <h5 class="card-title mb-1"><?php echo $brg->nama_wo?></h5>
			    <small><?php echo $brg->keterangan?></small><br>
			    <span class="badge badge-success mb-3">Rp. <?php echo $brg->harga ?></span><br>
			    <?php echo anchor('dashboard/tambah_ke_keranjang/' .$brg->id_wo, '<div class="btn btn_sm btn-warning">Pilih Kost</div>') ?>
			    <?php echo anchor('dashboard/detail/' .$brg->id_wo, '<div class="btn btn_sm btn-info">Detail</div>') ?>
			  </div>
			</div>

		<?php endforeach; ?>
	</div>
</div>